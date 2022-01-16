import 'package:postgresUn/core/providers/service_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/data/projects_datasource.dart';
import 'package:postgresUn/modules/projects/data/projects_local_datasource.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_manager.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_state.dart';
import 'package:riverpod/riverpod.dart';

class ProjectsProvider {
  static Provider<ProjectsLocalDatasource> projectsLocalDatasource = Provider(
    (ref) => ProjectsLocalDatasource(
      postgresService: ref.watch(ServiceProvider.postgres),
    ),
  );
  static Provider<ProjectsRepository> projectsRepository = Provider(
    (ref) => ProjectsRepository(
      localDatasource: ref.watch(projectsLocalDatasource),
    ),
  );
  static Provider<ProjectsManager> projectsManager = Provider(
    (ref) => ProjectsManager(
      userState: ref.watch(UserProvider.userState),
      projectsRepository: ref.watch(projectsRepository),
    ),
  );
  static StateNotifierProvider<ProjectsManager, ProjectsState> projectsState =
      StateNotifierProvider(
    (ref) => ref.watch(projectsManager),
  );
}
