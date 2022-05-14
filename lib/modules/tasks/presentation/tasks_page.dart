import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/modules/tasks/presentation/dialog_task.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_body.dart';
import 'package:postgresUn/modules/tasks/tasks_provider.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final tasksManager = ref.watch(TasksProvider.tasksManagerProvider);
    final projectManager = ref.watch(ProjectsProvider.projectManagerProvider);
    useEffect(
      () {
        tasksManager.onInit();
        return null;
      },
      const [],
    );
    final tasksSort = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.tasksSort),
    );

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DialogTask();
                  },
                );
              },
              child: const Text('Add task'),
            ),
            const SizedBox(width: 50),
            DropdownButton<String>(
              icon: const Icon(Icons.sort),
              value: tasksSort.name,
              items: [
                for (var typeSort in TasksSort.values)
                  DropdownMenuItem(
                    child: Text(typeSort.stringTitle),
                    onTap: () {
                      projectManager.selectTasksSort(typeSort);
                    },
                    value: typeSort.name,
                  ),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(width: 50),
          ],
        ),
        const TasksPageBody(),
      ],
    );
  }
}
