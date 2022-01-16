import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class ProjectsLocalDatasource extends ProjectsDatasource {
  final PostgresService _postgresService;

  ProjectsLocalDatasource({
    required PostgresService postgresService,
  }) : _postgresService = postgresService;

  @override
  Future<Project> create(StartProject project) async {
    const query = 'WITH project AS (INSERT INTO projects (title) '
        'VALUES (@title) RETURNING id)'
        'INSERT INTO project_user (project_id, role_id, user_id) '
        'SELECT project.id, 1, @user_id FROM project RETURNING project_id;';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'title': project.title,
        'user_id': project.creator.id,
      },
    );
    return Project(
      id: response[0]['project_user']!['project_id'],
      countDoneTasks: 0,
      countTasks: 0,
      creator: project.creator,
      participants: project.participants,
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
  Future<Project> project(String id) async {
    const query = '''
        SELECT users.id AS user_id, users.name AS user_name, users.last_name AS user_last_name, users.patronymic AS user_patronymic, 
          users.email AS user_email, users.phone AS user_phone, users.photo AS user_photo,
            roles.id AS role_id ,roles.name AS  role_name, 
            projects.id AS project_id, projects.title AS project_title, 
            projects.count_tasks AS project_count_tasks, projects.count_done_tasks AS project_count_done_tasks
            FROM project_user INNER JOIN users ON project_user.user_id = users.id 
                      INNER JOIN projects ON project_user.project_id = projects.id
                      INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = @project_id
        ''';
    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'project_id': id,
      },
    );
    final participants = response
        .map(
          (e) => ProjectUser.fromJson(
            e['users']!
              ..putIfAbsent('user_role', () => e['roles']!['role_name']),
          ),
        )
        .toSet();
    final creator = participants.firstWhere(
      (element) => element.role == ProjectUserRoles.admin,
    );
    final project = Project.fromJson(response[0]['projects']!).copyWith(
      creator: creator,
      participants: participants,
    );

    return project;
  }

  @override
  Future<List<Project>> projects(User user) async {
    const query = '''
        SELECT users.id AS user_id, users.name AS user_name, users.last_name AS user_last_name, users.patronymic AS user_patronymic, 
          users.email AS user_email, users.phone AS user_phone, users.photo AS user_photo, roles.name AS user_role,
          roles.id AS role_id ,roles.name AS  role_name, 
          projects.id AS project_id, projects.title AS project_title, 
          projects.count_tasks AS project_count_tasks, projects.count_done_tasks AS project_count_done_tasks
          FROM project_user 
                INNER JOIN users ON project_user.user_id = users.id 
              INNER JOIN projects ON project_user.project_id = projects.id
              INNER JOIN roles ON project_user.role_id = roles.id 
          WHERE user_id = @user_id
        ''';

    final response = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'user_id': user.id,
      },
    );
    final listProjectsRaw = response
        .map(
          (e) => e['projects']!
            ..putIfAbsent(
              'project_creator',
              () => e['users']!
                ..putIfAbsent(
                  'user_role',
                  () => e['roles']!['role_name'],
                ),
            ),
        )
        .toList();

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
    if (projectUser == project.creator) {
      throw Exception(
        'Don\'t remove participant, because User is creator of project',
      );
    }
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
    const query = 'INSERT INTO project_user (project_id, user_id, role_id) '
        'VALUES (@project_id, @user_id, @role_id)';
    await _postgresService.execute(
      query,
      values: {
        'project_id': project.id,
        'user_id': projectUser.id,
        'role_id': ProjectUserRoles.admin.index,
      },
    );
  }
}
