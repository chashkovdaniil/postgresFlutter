import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';

import '../../core/providers/service_provider.dart';
import '../../core/providers/user_provider.dart';
import 'data/tasks_api.dart';

class TasksProvider {
  static AutoDisposeProvider<TasksApi> tasksApi = Provider.autoDispose((ref) {
    return TasksApi(postgresService: ref.watch(ServiceProvider.postgres));
  });

  static AutoDisposeProvider<TasksManager> tasksManagerProvider =
      Provider.autoDispose(
    (ref) {
      final tasksManager = TasksManager(
        projectStateHolder: ref.watch(
          ProjectsProvider.projectStateProvider.notifier,
        ),
        projectManager: ref.watch(ProjectsProvider.projectManagerProvider),
        userState: ref.watch(UserProvider.userState),
        tasksApi: ref.watch(tasksApi),
      );
      ref.onDispose(tasksManager.onDispose);
      return tasksManager;
    },
  );
}
