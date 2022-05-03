import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:riverpod/riverpod.dart';

class ProjectsLocalDatasource extends ProjectsDatasource {
  final PostgresService _postgresService;

  ProjectsLocalDatasource({
    required PostgresService postgresService,
  }) : _postgresService = postgresService;

  @override
  Future<Project> create(StartProject project) async {
    const query = 'CALL public.create_project(@project_title,@user_id)';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'project_title': project.title,
        'user_id': project.users.elementAt(0).id,
      },
    );
    return Project(
      id: response[0].values.first['new_project_id'],
      countDoneTasks: 0,
      countTasks: 0,
      admins: project.admins,
      users: project.users,
      title: project.title,
    );
  }

  @override
  Future<void> delete(Project project) async {
    const query = 'DELETE FROM projects WHERE id = @project_id;';
    await _postgresService.execute(
      query,
      values: {
        'project_id': project.id,
      },
    );
  }

  @override
  Future<Project> project(int id) async {
    const query = '''SELECT * FROM projects WHERE id = @project_id;''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'project_id': id,
      },
    );
    var _project = Project.fromJson(response[0]['projects']!);
    final _users = await participants(_project);
    _project = _project.copyWith(
      users: _users,
      admins: _users
          .where((element) => element.role == ProjectUserRoles.admin)
          .toSet(),
    );

    final _tasks = await tasks(_project);
    final _messages = await messages(_project);

    return _project.copyWith(
      tasks: _tasks,
      messages: _messages,
    );
  }

  @override
  Future<List<Project>> projects(User user) async {
    const query = '''
        SELECT projects.* FROM project_user 
                INNER JOIN users ON project_user.user_id = users.id 
              INNER JOIN projects ON project_user.project_id = projects.id 
          WHERE user_id = @user_id
        ''';

    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'user_id': user.id,
      },
    );
    final listProjectsRaw = response.map((e) => e['projects']!).toList();

    return listProjectsRaw.map(Project.fromJson).toList();
  }

  @override
  Future<void> update(Project project) async {
    const query = 'UPDATE projects SET title = @title '
        'WHERE project_id = @project_id';
    await _postgresService.execute(query);
  }

  @override
  Future<void> removeParticipants(
    Project project,
    ProjectUser projectUser,
  ) async {
    const query = 'DELETE FROM project_user '
        'WHERE user_id = @user_id AND project_id = @project_id';
    await _postgresService.execute(
      query,
      values: {
        'project_id': project.id,
        'user_id': projectUser.id,
      },
    );
  }

  @override
  Future<void> addParticipants(Project project, ProjectUser projectUser) async {
    const query = 'INSERT INTO project_user (project_id, user_id) '
        'VALUES (@project_id, @user_id)';
    await _postgresService.execute(
      query,
      values: {
        'project_id': project.id,
        'user_id': projectUser.id,
      },
    );
  }

  @override
  Future<Task> addTask(Project project, Task task) async {
    const query =
        '''WITH creator AS (SELECT id FROM project_user WHERE project_id = @project_id AND user_id = @creator_id),
         	  performer AS (SELECT id FROM project_user WHERE project_id = @project_id AND user_id = @performer_id)
            INSERT INTO tasks (title, description, creator_id, performer_id) VALUES (@title, @description, (SELECT id FROM creator), (SELECT id FROM performer)) RETURNING id;
        ''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'title': task.title,
        'description': task.description,
        'project_id': project.id,
        'creator_id': task.creator.id,
        'performer_id': task.performer.id,
      },
    );
    return task.copyWith(id: response[0]['tasks']!['id'] as int);
  }

  @override
  Future<List<Task>> tasks(Project project) async {
    const query = '''
      WITH creators AS (
        SELECT id, user_id AS creator_id FROM project_user WHERE project_id = @project_id
      ), performers AS (
        SELECT id, user_id AS performer_id FROM project_user WHERE project_id = @project_id
      )
      SELECT * FROM tasks JOIN creators ON tasks.creator_id = creators.id JOIN performers ON tasks.performer_id = performers.id
      ''';
    final raw = await _postgresService.mappedResultsQuery(
      query,
      values: {'project_id': project.id},
    );
    final _tasks = raw.map(
      (e) {
        final creator = project.users!
            .firstWhere(
              (element) => element.id == e['project_user']!['creator_id'],
            )
            .toJson();
        final performer = project.users!
            .firstWhere(
              (element) => element.id == e['project_user']!['performer_id'],
            )
            .toJson();
        return Task.fromJson(
          e['tasks']!
            ..putIfAbsent('creator', () => creator)
            ..putIfAbsent('performer', () => performer),
        );
      },
    ).toList();

    return _tasks;
  }

  @override
  Future<void> updateTask(Project project, Task task) async {
    const query = '''
        UPDATE tasks SET title = @title, description = @description,
        performer_id = (SELECT id FROM project_user WHERE project_id = @project_id AND
        user_id = @user_id), is_done = @is_done WHERE id = @id;
    ''';
    await _postgresService.execute(
      query,
      values: {
        'title': task.title,
        'description': task.description,
        'project_id': project.id,
        'user_id': task.performer.id,
        'is_done': task.isDone,
        'id': task.id,
      },
    );
  }

  @override
  Future<void> deleteTask(Task task) async {
    const query = '''DELETE FROM tasks WHERE id = @id''';
    await _postgresService.execute(
      query,
      values: {'id': task.id},
    );
  }

  @override
  Future<List<Message>> messages(Project project) async {
    const query = '''
    WITH messages_users AS (
      SELECT id AS message_user, user_id FROM project_user WHERE project_id = @project_id
    )
    SELECT * FROM messages INNER JOIN messages_users ON project_user_id = message_user ORDER BY timestamp ASC
    ''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {'project_id': project.id},
    );
    return response.map((e) {
      final user = project.users!
          .firstWhere((u) => u.id == e['project_user']!['user_id']);
      final json = e['messages']!..putIfAbsent('user', user.toJson);
      return Message.fromJson(json);
    }).toList();
  }

  @override
  Future<Message> sendMessage(Project project, Message message) async {
    const query = '''
      INSERT INTO messages (text, project_user_id, timestamp) 
        SELECT @text,  project_user.id,  @timestamp FROM project_user
        WHERE project_id = @project_id AND user_id = @user_id
        RETURNING id
    ''';

    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'text': message.text,
        'timestamp': message.timestamp,
        'project_id': project.id,
        'user_id': message.user.id,
      },
    );
    return message.copyWith(
      id: response[0]['messages']!['id'],
    );
  }

  @override
  Future<Set<ProjectUser>> participants(Project project) async {
    const query = '''
      SELECT users.*, roles.name AS  role_name
      FROM project_user INNER JOIN users ON project_user.user_id = users.id 
      INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = @project_id
    ''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {'project_id': project.id},
    );
    return response
        .map(
          (e) => ProjectUser.fromJson(
            e['users']!
              ..putIfAbsent(
                'role',
                () => e['roles']!['role_name'],
              ),
          ),
        )
        .toSet();
  }
}
