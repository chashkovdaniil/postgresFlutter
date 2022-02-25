import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';

class DialogTask extends HookConsumerWidget {
  const DialogTask({
    Key? key,
    required this.project,
    this.task,
  }) : super(key: key);

  final Project project;
  final Task? task;

  @override
  Widget build(context, ref) {
    final projectManager = ref.watch(ProjectsProvider.projectsManager);
    final user = ref.watch(UserProvider.userState).user!;
    final titleController = useTextEditingController(
      text: task == null ? '' : task!.title,
    );
    final descriptionController = useTextEditingController(
      text: task == null ? '' : task!.description,
    );
    final performer = useState<ProjectUser?>(
      task == null ? null : task!.performer,
    );
    final displaySize = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    final users = project.users!.toList()
      ..removeWhere((element) => element.id == 0);
    return AlertDialog(
      title: const Text('Task'),
      content: SizedBox(
        width: displaySize.width * 0.9,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Fill field';
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  // expands: true,
                  maxLines: null,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Fill field';
                    }
                    return null;
                  },
                  maxLength: 1000,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                  ),
                ),
              ),
              FormField<ProjectUser>(
                initialValue: performer.value,
                validator: (val) {
                  if (val == null) {
                    return 'Fill field';
                  }
                  return null;
                },
                onSaved: (val) {
                  performer.value = val;
                },
                builder: (state) => DropdownButton<ProjectUser>(
                  isExpanded: true,
                  hint: const Text('Performer'),
                  value: state.value,
                  items: users
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.fullname),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    state
                      ..didChange(val)
                      ..save();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              final _task = Task(
                id: task == null ? null : task!.id,
                title: titleController.text,
                description: descriptionController.text,
                creator: users.firstWhere((element) => element.id == user.id),
                performer: performer.value!,
                isDone: task == null ? false : task!.isDone,
              );
              if (task == null) {
                projectManager.addTask(_task);
              } else {
                projectManager.updateTask(_task);
              }
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
