import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/presentation/dialog_task.dart';

class Tasks extends HookConsumerWidget {
  const Tasks({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(context, ref) {
    final projectManager = ref.watch(ProjectsProvider.projectsManager);
    return Column(
      children: [
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DialogTask(project: project);
              },
            );
          },
          child: Text('Add task'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: project.tasks!.length,
            itemBuilder: (context, index) {
              final task = project.tasks![index];
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
                        projectManager.updateTask(
                          task.copyWith(
                            isDone: !task.isDone,
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.check,
                        color:
                            task.isDone ? Theme.of(context).primaryColor : null,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        projectManager.deleteTask(task);
                      },
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
                      project: project,
                      task: task,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
