// import 'package:flutter_test/flutter_test.dart';
// import 'package:postgresUn/core/services/postgres_service.dart';
// import 'package:postgresUn/modules/projects/domain/entities/project.dart';
// import 'package:postgresUn/modules/tasks/data/tasks_datasource.dart';
// import 'package:postgresUn/modules/tasks/data/tasks_local_datasource.dart';
// import 'package:postgresUn/modules/tasks/data/tasks_repository.dart';
// import 'package:postgresUn/modules/users/data/user_repository_impl.dart';

// void main() {
//   final TasksDatasource tasksDatasource = TasksLocalDatasource(
//     PostgresService()..init(),
//   );
//   final TasksRepository tasksRepository = TasksRepository(tasksDatasource);
//   test('dd', () async {
//     await tasksRepository.tasksByProject(
//       Project(id: 61, title: 'title', countTasks: 0, countDoneTasks: 0),
//     );
//   });
// }
