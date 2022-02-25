import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    int? id,
    required String text,
    required ProjectUser user,
    @JsonKey(fromJson: Message.dateTimeFromJson) required DateTime timestamp,
  }) = _Message;

  static DateTime dateTimeFromJson(dynamic val) {
    return val as DateTime;
  }

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
