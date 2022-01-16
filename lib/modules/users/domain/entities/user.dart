import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    required String patronymic,
    required String email,
    required int phone,
    required String photo,
    required String permission,
    required String password,
    @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static DateTime? dateTimeFromJson(dynamic val) {
    return val as DateTime?;
  }
}
