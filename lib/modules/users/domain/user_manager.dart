import 'package:postgresUn/modules/users/domain/entities/auth_user.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:postgresUn/modules/users/domain/user_repository.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

class UserManager extends StateNotifier<UserState> {
  final UserRepository _userRepository;
  UserManager({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserState());

  void user(User? user) {
    state = state.copyWith(user: user);
  }

  Future<void> login(AuthUser authUser) async {
    final user = await _userRepository.userByEmail(authUser.email);
    // ToDo: compare password
    state = state.copyWith(user: user);
  }

  Future<void> register(RegisterUser registerUser) async {
    final user = await _userRepository.create(registerUser);
    // ToDo: compare password
    state = state.copyWith(user: user);
  }

  Future<void> signOut() async {
    state = state.copyWith(user: null);
  }
}
