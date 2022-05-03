import 'package:postgresUn/core/exceptions.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_manager.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_state_holder.dart';

import '../../domain/task.dart';

class TasksManager {
  final TasksStateHolder tasksStateHolder;
  final ProjectStateHolder projectStateHolder;
  final ProjectsRepository projectsRepository;

  TasksManager({
    required this.tasksStateHolder,
    required this.projectStateHolder,
    required this.projectsRepository,
  });

  void setTasks(List<Task> tasks) {
    tasksStateHolder.setTasks(tasks);
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
