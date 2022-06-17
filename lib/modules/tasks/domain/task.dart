import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskPriority { nonUrgent, normal, urgent }

@freezed
class Task with _$Task {
  const factory Task({
    int? id,
    required String title,
    required String description,
    required ProjectUser creator,
    required ProjectUser performer,
    @JsonKey(name: 'is_done') @Default(false) bool isDone,
    @JsonKey(fromJson: Task.priorityFromJson)
    @Default(TaskPriority.nonUrgent)
        TaskPriority priority,
    required double cost,
    @JsonKey(name: 'created_at', fromJson: Task.createdAtFromJson)
        required DateTime createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  static TaskPriority priorityFromJson(dynamic val) {
    switch (val as int) {
      case 2:
        return TaskPriority.urgent;
      case 1:
        return TaskPriority.normal;
      default:
        return TaskPriority.nonUrgent;
    }
  }

  static DateTime createdAtFromJson(dynamic val) => val as DateTime;
}
