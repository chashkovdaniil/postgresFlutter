import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/modules/tasks/presentation/dialog_task.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_body.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Column(
      children: [
        const SizedBox(height: 10),
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
        const TasksPageBody(),
      ],
    );
  }
}
