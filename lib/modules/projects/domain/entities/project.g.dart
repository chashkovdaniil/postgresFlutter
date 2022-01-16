// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['project_id'] as int,
      title: json['project_title'] as String,
      countTasks: json['project_count_tasks'] as int,
      countDoneTasks: json['project_count_done_tasks'] as int,
      participants: (json['project_participants'] as List<dynamic>?)
          ?.map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toSet(),
      creator: json['project_creator'] == null
          ? null
          : ProjectUser.fromJson(
              json['project_creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'project_id': instance.id,
      'project_title': instance.title,
      'project_count_tasks': instance.countTasks,
      'project_count_done_tasks': instance.countDoneTasks,
      'project_participants': instance.participants?.toList(),
      'project_creator': instance.creator,
    };

_$_StartProject _$$_StartProjectFromJson(Map<String, dynamic> json) =>
    _$_StartProject(
      title: json['title'] as String,
      countTasks: json['countTasks'] as int?,
      countDoneTasks: json['countDoneTasks'] as int?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toSet(),
      creator: ProjectUser.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StartProjectToJson(_$_StartProject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'countTasks': instance.countTasks,
      'countDoneTasks': instance.countDoneTasks,
      'participants': instance.participants.toList(),
      'creator': instance.creator,
    };
