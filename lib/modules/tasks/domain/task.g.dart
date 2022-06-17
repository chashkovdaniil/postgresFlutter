// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      creator: ProjectUser.fromJson(json['creator'] as Map<String, dynamic>),
      performer:
          ProjectUser.fromJson(json['performer'] as Map<String, dynamic>),
      isDone: json['is_done'] as bool? ?? false,
      priority: json['priority'] == null
          ? TaskPriority.nonUrgent
          : Task.priorityFromJson(json['priority']),
      cost: (json['cost'] as num).toDouble(),
      createdAt: Task.createdAtFromJson(json['created_at']),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'performer': instance.performer,
      'is_done': instance.isDone,
      'priority': _$TaskPriorityEnumMap[instance.priority],
      'cost': instance.cost,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.nonUrgent: 'nonUrgent',
  TaskPriority.normal: 'normal',
  TaskPriority.urgent: 'urgent',
};
