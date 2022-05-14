import 'package:flutter_test/flutter_test.dart';
import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/data/projects_local_datasource.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/data/user_datasource.dart';
import 'package:postgresUn/modules/users/data/user_local_datasource.dart';
import 'package:postgresUn/modules/users/data/user_repository_impl.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:postgresUn/modules/users/domain/user_repository.dart';

void main() {
  final UserDatasource userDatasource = UserLocalDatasource(
    postgresService: PostgresService()..init(),
  );
  final UserRepository userRepository = UserRepositoryImpl(
    localDatasource: userDatasource,
  );
  final ProjectsDatasource projectsDatasource = ProjectsLocalDatasource(
    postgresService: PostgresService()..init(),
  );
  final projectsRepository = ProjectsRepository(
    localDatasource: projectsDatasource,
  );
  test('Create & delete project', () async {
    // try {
    //   const projectUser = ProjectUser(
    //     id: 21,
    //     name: '123',
    //     lastName: '123',
    //     patronymic: '123',
    //     email: 'em@em.em',
    //     phone: 99,
    //     photo: 'none',
    //     role: ProjectUserRoles.admin,
    //   );
    //   final startProject = StartProject(
    //     title: 'title',
    //     users: {projectUser},
    //     creator: projectUser,
    //   );
    //   final res = await projectsRepository.create(startProject);
    //   await projectsRepository.delete(res);
    //   expect(true, true);
    // } catch (err) {
    //   expect(true, false);
    // }
  });

  test('projects', () async {
    final user = await userRepository.user(20);
    final result = await projectsRepository.projects(user);
  });
}
