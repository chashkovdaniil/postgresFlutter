import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/projects_provider.dart';
import 'dialog_task.dart';

class TasksPageBody extends HookConsumerWidget {
  const TasksPageBody({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final tasksManager = ref.watch(ProjectsProvider.tasksManagerProvider);
    final tasks = ref.watch(
      ProjectsProvider.tasksStateProvider.select((s) => s.tasks),
    );

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    decoration: task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
            ),
            subtitle: Text(
              'Creator: ' +
                  task.creator.fullname +
                  '\nPerformer: ' +
                  task.performer.fullname,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    tasksManager.updateTask(
                      task.copyWith(
                        isDone: !task.isDone,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.check,
                    color: task.isDone ? Theme.of(context).primaryColor : null,
                  ),
                ),
                IconButton(
                  onPressed: () => tasksManager.deleteTask(task),
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => DialogTask(
                  task: task,
                ),
              );
            },
          );
        },
      ),
    );
  }
}