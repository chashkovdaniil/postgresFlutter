import 'dart:async';

import 'package:postgresUn/core/exceptions.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_manager.dart';
import 'package:postgresUn/modules/tasks/data/tasks_api.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';

import '../../domain/task.dart';

enum TasksSort { date, title, isDone }

enum TasksSortByAplha { asc, desc }

extension TasksSortX on TasksSort {
  String get stringTitle {
    if (this == TasksSort.date) {
      return 'По дате';
    } else if (this == TasksSort.isDone) {
      return 'По завершённости';
    } else if (this == TasksSort.title) {
      return 'По названию';
    } else {
      return '';
    }
  }
}

extension TasksSortByAplhaX on TasksSortByAplha {
  String get stringTitle {
    if (this == TasksSortByAplha.asc) {
      return 'По возрастанию';
    } else if (this == TasksSortByAplha.desc) {
      return 'По убыванию';
    } else {
      return '';
    }
  }
}

class TasksManager {
  final ProjectManager projectManager;
  final ProjectStateHolder projectStateHolder;
  final UserState userState;
  final TasksApi tasksApi;
  StreamSubscription? _tasksStream;

  TasksManager({
    required this.projectManager,
    required this.projectStateHolder,
    required this.userState,
    required this.tasksApi,
  });

  Future<void> onInit() async {
    final stream = Stream.periodic(const Duration(milliseconds: 1000));
    _tasksStream = stream.listen((event) async {
      await loadTasks();
    });
  }

  onDispose() => _tasksStream?.cancel();

  Future<void> loadTasks([TasksSort sort = TasksSort.date]) async {
    final project = projectStateHolder.currentProject;
    if (project != null) {
      final typeSort = projectStateHolder.state.tasksSort;
      final typeSortByAlpha = projectStateHolder.state.tasksSortByAlpha;
      final tasks = await tasksApi.tasks(project, typeSort, typeSortByAlpha);
      setTasks(tasks);
    }
  }

  void setTasks(List<Task> tasks) => projectManager.setTasks(tasks);

  Future<void> saveTask({
    int? id,
    ProjectUser? creator,
    required ProjectUser performer,
    required String title,
    required String description,
    bool isDone = false,
    double cost = 0.0,
  }) async {
    final user = userState.user;
    final project = projectStateHolder.currentProject;
    final projectUser = project?.users?.firstWhere((e) => e.id == user?.id);

    if (user == null) throw UserNotAuthExceptions();
    if (project == null) throw ProjectNullException();

    if (projectUser == null) {
      throw Exception('user not found');
    }
    final task = Task(
      id: id,
      title: title,
      description: description,
      creator: creator ?? projectUser,
      performer: performer,
      isDone: isDone,
      cost: cost,
    );
    if (task.id == null) {
      await addTask(task);
    } else {
      await updateTask(task);
    }
  }

  Future<void> addTask(Task task) async {
    final project = projectStateHolder.currentProject;
    if (project == null) throw ProjectNullException();

    tasksApi.addTask(project, task);
    projectManager.onInit(project.id);
  }

  Future<void> updateTask(Task task) async {
    final project = projectStateHolder.currentProject;
    if (project == null) throw ProjectNullException();

    await tasksApi.updateTask(project, task);
  }

  Future<void> deleteTask(Task task) async {
    final project = projectStateHolder.currentProject;
    if (project == null) throw ProjectNullException();
    await tasksApi.deleteTask(task);
    projectManager.onInit(project.id);
  }
}
