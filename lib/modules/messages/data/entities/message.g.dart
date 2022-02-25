// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as int?,
      text: json['text'] as String,
      user: ProjectUser.fromJson(json['user'] as Map<String, dynamic>),
      timestamp: Message.dateTimeFromJson(json['timestamp']),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user': instance.user,
      'timestamp': instance.timestamp.toIso8601String(),
    };
