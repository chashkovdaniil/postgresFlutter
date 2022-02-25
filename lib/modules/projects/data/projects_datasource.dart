import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

abstract class ProjectsDatasource {
  Future<Project> create(StartProject project);
  Future<void> update(Project project);
  Future<void> delete(Project project);
  Future<List<Project>> projects(User user);
  Future<Project> project(String id);
  Future<Task> addTask(Project project, Task task);
  Future<void> updateTask(Project project, Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> tasks(Project project);
  Future<void> removeParticipants(Project project, ProjectUser projectUser);
  Future<void> addParticipants(Project project, ProjectUser projectUser);
  Future<List<Message>> messages(Project project);
  Future<Message> sendMessage(Project project, Message message);
  Future<Set<ProjectUser>> participants(Project project);
}
