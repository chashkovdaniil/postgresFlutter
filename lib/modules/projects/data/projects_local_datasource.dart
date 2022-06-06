import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

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
      budget: project.budget,
      description: project.description,
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
          .toList(),
    );

    // final _tasks = await tasks(_project);

    return _project;
  }

  @override
  Future<List<Project>> projects(User user) async {
    const query = '''
        SELECT projects.* FROM project_user 
                INNER JOIN users ON project_user.user_id = users.id 
              INNER JOIN projects ON project_user.project_id = projects.id 
          WHERE user_id = @user_id ORDER BY id DESC
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
  Future<List<Message>> messages(Project project) async {
    const query = '''
    SELECT * FROM messages INNER JOIN (
      SELECT id AS message_user, user_id FROM project_user WHERE project_id = @project_id
    ) as messages_user ON project_user_id = message_user ORDER BY timestamp ASC
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
  Future<List<ProjectUser>> participants(Project project) async {
    const query = '''
      SELECT users.*, roles.name AS  role_name, positions.name AS post
      FROM project_user INNER JOIN users ON project_user.user_id = users.id LEFT JOIN positions ON users.post_id = positions.id
      INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = @project_id
    ''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {'project_id': project.id},
    );

    final result = [
      for (var tables in response)
        ProjectUser.fromJson(
          tables['users']!
            ..putIfAbsent(
              'role',
              () => tables['roles']!['role_name'],
            )
            ..putIfAbsent(
              'post',
              () => tables['positions']!['post'],
            ),
        ),
    ];
    return result;
  }
}
