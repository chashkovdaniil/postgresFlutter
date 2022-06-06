import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/core/converters/file_converter.dart';

part 'register_user.freezed.dart';

@freezed
class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    required String name,
    required String lastName,
    required String patronymic,
    required String email,
    required int phone,
    @FileConverter() required File photo,
    required String password,
    @Default('user') String permission,
    DateTime? birthdate,
    String? post,
  }) = _RegisterUser;
}
