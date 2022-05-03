import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class ProjectsRepository {
  final ProjectsDatasource _localDatasource;
  ProjectsRepository({
    required ProjectsDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  Future<Project> create(StartProject project) {
    return _localDatasource.create(project);
  }

  Future<void> update(Project project) {
    return _localDatasource.update(project);
  }

  Future<void> delete(Project project) {
    return _localDatasource.delete(project);
  }

  Future<List<Project>> projects(User user) {
    return _localDatasource.projects(user);
  }

  Future<Project> project(int id) {
    return _localDatasource.project(id);
  }

  Future<Task> addTask(Project project, Task task) {
    return _localDatasource.addTask(project, task);
  }

  Future<void> updateTask(Project project, Task task) {
    return _localDatasource.updateTask(project, task);
  }

  Future<void> deleteTask(Task task) {
    return _localDatasource.deleteTask(task);
  }

  Future<void> addParticipants(Project project, ProjectUser projectUser) {
    return _localDatasource.addParticipants(project, projectUser);
  }

  Future<void> removeParticipants(Project project, ProjectUser projectUser) {
    return _localDatasource.removeParticipants(project, projectUser);
  }

  Future<List<Message>> messages(Project project) {
    return _localDatasource.messages(project);
  }

  Future<Message> sendMessage(Project project, Message message) {
    return _localDatasource.sendMessage(project, message);
  }
}
