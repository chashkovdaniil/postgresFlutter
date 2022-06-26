import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/app_loader/domain/app_loader_state.dart';
import 'package:postgresUn/modules/users/domain/user_manager.dart';

class AppLoaderManager {
  final PostgresService postgresService;
  final UserManager userManager;
  final AppLoaderState appLoaderState;
  AppLoaderManager({
    required this.postgresService,
    required this.userManager,
    required this.appLoaderState,
  });

  Future<void> init() async {
    await postgresService.init();
    await userManager.init();
    appLoaderState.loaded();
  }
}
