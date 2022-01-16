import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const UserState._();
  const factory UserState({
    User? user,
  }) = _UserState;

  bool get isAuth => user != null;
}
