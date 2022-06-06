import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/projects_provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../projects/domain/entities/project_user.dart';
import '../../users/domain/entities/user.dart';
import '../participants_provider.dart';

class AddParticipantsDialog extends HookConsumerWidget {
  const AddParticipantsDialog({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );
    final userRepository = ref.watch(UserProvider.userRepository);

    if (project == null) {
      return const CircularProgressIndicator();
    }

    final participantsManager =
        ref.watch(ParticipantProvider.participantsManagerProvider);
    final participantFieldController = useTextEditingController();
    final formKey = GlobalKey<FormState>(debugLabel: 'addParticipantsForm');
    final projectUser = useState<User?>(null);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
      ),
      child: Form(
        key: formKey,
        child: AlertDialog(
          title: const Text('Участники'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const _ChipUsers(),
              TextFormField(
                controller: participantFieldController,
                autofocus: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Заполните поле';
                  }
                  if (val.isNotEmpty && projectUser.value == null) {
                    return 'Пользователь не найден';
                  }
                  return null;
                },
                onFieldSubmitted: (text) async {
                  try {
                    projectUser.value = await userRepository.userByEmail(text);
                    if (projectUser.value != null) {
                      final participant = ProjectUser.fromUser(
                        projectUser.value!,
                        ProjectUserRoles.user,
                      );
                      participantsManager.addParticipant(project, participant);
                      participantFieldController.clear();
                    }
                  } catch (err) {
                    formKey.currentState?.validate();
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Email'),
                  suffix: IconButton(
                    onPressed: () async {
                      try {
                        projectUser.value = await userRepository.userByEmail(
                          participantFieldController.text,
                        );
                        if (projectUser.value != null) {
                          final participant = ProjectUser.fromUser(
                            projectUser.value!,
                            ProjectUserRoles.user,
                          );
                          participantsManager.addParticipant(
                            project,
                            participant,
                          );
                          participantFieldController.clear();
                        }
                      } catch (err) {
                        formKey.currentState?.validate();
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipUsers extends ConsumerWidget {
  const _ChipUsers({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );
    final currentUser = ref.watch(UserProvider.userState.select((s) => s.user));

    if (project == null || currentUser == null) {
      return const CircularProgressIndicator();
    }

    final projectState = ref.watch(ProjectsProvider.projectStateProvider);
    final participantsManager =
        ref.watch(ParticipantProvider.participantsManagerProvider);
    final participants = projectState.participants;

    if (participants == null) {
      return const Center(child: CircularProgressIndicator());
    }
    participants.removeWhere((element) => element.id == 0);

    return Wrap(
      spacing: 10,
      children: [
        for (var user in participants)
          Chip(
            avatar: CircleAvatar(
              foregroundImage: Image.file(
                user.photo,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ).image,
              child: const Icon(Icons.photo),
            ),
            label: Text(user.email),
            onDeleted: user.id == currentUser.id
                ? null
                : () => participantsManager.removeParticipant(project, user),
          ),
      ],
    );
  }
}
