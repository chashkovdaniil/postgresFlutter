import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/task.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    required List<Task> tasks,
  }) = _TasksState;
}
