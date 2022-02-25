import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/core/converters/file_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    required String patronymic,
    required String email,
    required int phone,
    @FileConverter() required File photo,
    required String permission,
    required String password,
    @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate,
  }) = _User;

  String get fullname {
    return '$lastName $name $patronymic';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static DateTime? dateTimeFromJson(dynamic val) {
    return val as DateTime?;
  }
}
