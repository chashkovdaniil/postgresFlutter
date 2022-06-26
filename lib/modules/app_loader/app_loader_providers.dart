import 'package:postgresUn/core/providers/service_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/app_loader/domain/app_loader_manager.dart';
import 'package:postgresUn/modules/app_loader/domain/app_loader_state.dart';
import 'package:riverpod/riverpod.dart';

class AppLoaderProviders {
  static final appLoaderManager = Provider(
    (ref) => AppLoaderManager(
      postgresService: ref.watch(ServiceProvider.postgres),
      userManager: ref.watch(UserProvider.userManager),
      appLoaderState: ref.watch(appLoaderState.notifier),
    ),
  );

  static final appLoaderState = StateNotifierProvider((_) => AppLoaderState());
}
