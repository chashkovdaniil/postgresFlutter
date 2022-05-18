import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';

import '../../../core/services/postgres_service.dart';
import '../../projects/domain/entities/project.dart';
import '../domain/task.dart';

class TasksApi {
  final PostgresService _postgresService;

  TasksApi({
    required PostgresService postgresService,
  }) : _postgresService = postgresService;

  Future<List<Task>> tasks(Project project, TasksSort tasksSort,
      TasksSortByAplha tasksSortByAplha) async {
    var typeOrderBy = '';
    var typeOrderByAlpha = '';
    switch (tasksSort) {
      case TasksSort.date:
        typeOrderBy = 'tasks.id';
        break;
      case TasksSort.isDone:
        typeOrderBy = 'tasks.is_done';
        break;
      case TasksSort.title:
        typeOrderBy = 'tasks.title';
        break;
      default:
        typeOrderBy = '';
        break;
    }
    switch (tasksSortByAplha) {
      case TasksSortByAplha.asc:
        typeOrderByAlpha = 'ASC';
        break;
      case TasksSortByAplha.desc:
        typeOrderByAlpha = 'DESC';
        break;
    }
    final query = '''
      WITH creators AS (
        SELECT id, user_id AS creator_id FROM project_user WHERE project_id = @project_id
      ), 
      performers AS (
        SELECT id, user_id AS performer_id FROM project_user WHERE project_id = @project_id
      )
      SELECT * FROM tasks JOIN creators ON tasks.creator_id = creators.id JOIN performers ON tasks.performer_id = performers.id
      ORDER BY $typeOrderBy $typeOrderByAlpha
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

  Future<void> deleteTask(Task task) async {
    const query = '''DELETE FROM tasks WHERE id = @id''';
    await _postgresService.execute(query, values: {'id': task.id});
  }
}
