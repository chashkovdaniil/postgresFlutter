import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/tasks/tasks_provider.dart';

class DialogTask extends HookConsumerWidget {
  const DialogTask({
    Key? key,
    this.task,
  }) : super(key: key);

  final Task? task;

  @override
  Widget build(context, ref) {
    final tasksManager = ref.read(TasksProvider.tasksManagerProvider);
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

    return AlertDialog(
      title: const Text('Задание'),
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
                    return 'Заполните поле!';
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Заголовок'),
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
                      return 'Заполните поле!';
                    }
                    return null;
                  },
                  maxLength: 1000,
                  decoration: const InputDecoration(
                    label: Text('Описание'),
                  ),
                ),
              ),
              SelectUserField(
                performer: performer.value,
                onChange: (val) {
                  performer.value = val;
                },
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
          child: const Text('Закрыть'),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true &&
                performer.value != null) {
              tasksManager.saveTask(
                id: task?.id,
                creator: task?.creator,
                performer: performer.value!,
                title: titleController.text,
                description: descriptionController.text,
                isDone: task?.isDone ?? false,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    );
  }
}

class SelectUserField extends ConsumerWidget {
  const SelectUserField({
    Key? key,
    required this.onChange,
    required this.performer,
  }) : super(key: key);

  final ValueChanged<ProjectUser?> onChange;
  final ProjectUser? performer;

  @override
  Widget build(context, ref) {
    final users = ref.watch(
      ProjectsProvider.projectStateProvider
          .select((s) => s.currentProject?.users),
    );
    if (users == null) {
      return const CircularProgressIndicator();
    }
    return FormField<ProjectUser>(
      initialValue: performer,
      validator: (val) {
        if (val == null) {
          return 'Заполните поле!';
        }
        return null;
      },
      onSaved: onChange,
      builder: (state) => DropdownButton<ProjectUser>(
        isExpanded: true,
        hint: const Text('Исполнитель'),
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
    );
  }
}
