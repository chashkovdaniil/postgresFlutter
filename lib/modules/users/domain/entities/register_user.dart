import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user.freezed.dart';

@freezed
class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    required String name,
    required String lastName,
    required String patronymic,
    required String email,
    required int phone,
    required String photo,
    required String password,
    @Default('user') String permission,
    DateTime? birthdate,
  }) = _RegisterUser;
}
