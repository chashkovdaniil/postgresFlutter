// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as int,
      title: json['title'] as String,
      countTasks: json['count_tasks'] as int,
      countDoneTasks: json['count_done_tasks'] as int,
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String? ?? '',
      budget: (json['budget'] as num?)?.toDouble() ?? 0.0,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count_tasks': instance.countTasks,
      'count_done_tasks': instance.countDoneTasks,
      'tasks': instance.tasks,
      'description': instance.description,
      'budget': instance.budget,
      'users': instance.users,
      'admins': instance.admins,
    };

_$_StartProject _$$_StartProjectFromJson(Map<String, dynamic> json) =>
    _$_StartProject(
      title: json['title'] as String,
      description: json['description'] as String,
      budget: (json['budget'] as num).toDouble(),
      countTasks: json['countTasks'] as int?,
      countDoneTasks: json['countDoneTasks'] as int?,
      users: (json['users'] as List<dynamic>)
          .map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      admins: (json['admins'] as List<dynamic>)
          .map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StartProjectToJson(_$_StartProject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'countTasks': instance.countTasks,
      'countDoneTasks': instance.countDoneTasks,
      'users': instance.users,
      'admins': instance.admins,
    };
