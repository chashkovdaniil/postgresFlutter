import 'package:postgresUn/modules/tasks/presentation/state/tasks_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/task.dart';

class TasksStateHolder extends StateNotifier<TasksState> {
  TasksStateHolder([TasksState? state])
      : super(state ?? const TasksState(tasks: []));

  void setTasks(List<Task> tasks) {
    state = state.copyWith(tasks: tasks);
  }
}
