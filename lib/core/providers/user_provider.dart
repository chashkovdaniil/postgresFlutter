import 'package:postgresUn/core/providers/service_provider.dart';
import 'package:postgresUn/modules/users/data/user_datasource.dart';
import 'package:postgresUn/modules/users/data/user_local_datasource.dart';
import 'package:postgresUn/modules/users/data/user_repository_impl.dart';
import 'package:postgresUn/modules/users/domain/user_manager.dart';
import 'package:postgresUn/modules/users/domain/user_repository.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

class UserProvider {
  static Provider<UserLocalDatasource> localDatasource = Provider(
    (ref) => UserLocalDatasource(
      postgresService: ref.watch(ServiceProvider.postgres),
    ),
  );
  static Provider<UserRepositoryImpl> userRepository = Provider(
    (ref) => UserRepositoryImpl(localDatasource: ref.watch(localDatasource)),
  );
  static Provider<UserManager> userManager = Provider(
    (ref) => UserManager(userRepository: ref.watch(userRepository)),
  );
  static final StateNotifierProvider<UserManager, UserState> userState =
      StateNotifierProvider((ref) => ref.watch(userManager));
}
