import 'package:postgresUn/core/providers/service_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/data/projects_local_datasource.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_state.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_manager.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_state.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';
import 'package:riverpod/riverpod.dart';

import '../../modules/projects/presentation/state/project_manager.dart';

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

  static AutoDisposeProvider<ProjectManager> projectManagerProvider =
      Provider.autoDispose(
    (ref) {
      final projectManager = ProjectManager(
        userState: ref.watch(UserProvider.userState),
        projectsRepository: ref.watch(projectsRepository),
        stateHolder: ref.watch(projectStateProvider.notifier),
      );
      ref.onDispose(projectManager.onDispose);
      return projectManager;
    },
  );

  static AutoDisposeStateNotifierProvider<ProjectStateHolder, ProjectState>
      projectStateProvider = StateNotifierProvider.autoDispose(
    (ref) => ProjectStateHolder(),
  );
}
