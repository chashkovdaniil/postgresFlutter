import 'package:postgresUn/core/exceptions.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_manager.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_state_holder.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';

import '../../domain/task.dart';

class TasksManager {
  final TasksStateHolder tasksStateHolder;
  final ProjectStateHolder projectStateHolder;
  final ProjectsRepository projectsRepository;
  final UserState userState;

  TasksManager({
    required this.tasksStateHolder,
    required this.projectStateHolder,
    required this.projectsRepository,
    required this.userState,
  });

  void setTasks(List<Task> tasks) {
    tasksStateHolder.setTasks(tasks);
  }

  Future<void> saveTask({
    int? id,
    ProjectUser? creator,
    required ProjectUser performer,
    required String title,
    required String description,
    bool isDone = false,
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

    projectsRepository.addTask(project, task);
  }

  Future<void> updateTask(Task task) async {
    final project = projectStateHolder.currentProject;
    if (project == null) throw ProjectNullException();

    await projectsRepository.updateTask(project, task);
  }

  Future<void> deleteTask(Task task) async {
    final project = projectStateHolder.currentProject;
    if (project == null) throw ProjectNullException();
    await projectsRepository.deleteTask(task);
  }
}
