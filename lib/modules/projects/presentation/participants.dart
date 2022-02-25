import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class ProjectParticipants extends HookConsumerWidget {
  const ProjectParticipants({
    Key? key,
    required this.project,
    required this.user,
  }) : super(key: key);

  final Project project;
  final User user;

  @override
  Widget build(context, ref) {
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    final isAllowedAdmin =
        ref.watch(ProjectsProvider.projectsState).isAllowedAdmin;
    final users = project.users!.toList()
      ..removeWhere((element) => element.id == 0);
    return Column(
      children: [
        const SizedBox(height: 10),
        if (isAllowedAdmin)
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddParticipantsDialog();
                },
              );
            },
            child: const Text('Add participant'),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final participant = users.elementAt(index);
              return ListTile(
                key: ValueKey(participant.id),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${participant.lastName} '
                      '${participant.name} '
                      '${participant.patronymic} '
                      '(${participant.email})',
                    ),
                    if (participant.role == ProjectUserRoles.admin)
                      const Icon(
                        Icons.star,
                      ),
                  ],
                ),
                trailing: isAllowedAdmin && participant.id != user.id
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star),
                          ),
                          IconButton(
                            onPressed: () {
                              projectsManager.removeParticipant(participant);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class AddParticipantsDialog extends HookConsumerWidget {
  // final Project project;
  const AddParticipantsDialog({
    // required this.project,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final project = ref.watch(ProjectsProvider.projectsState).currentProject!;
    final userRepository = ref.watch(UserProvider.userRepository);
    final _users = project.users!.toList()
      ..removeWhere(
        (element) => element.id == 0,
      );
    final participantFieldController = useTextEditingController();
    final formKey = GlobalKey<FormState>(debugLabel: 'addParticipantsForm');
    final projectUser = useState<User?>(null);
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    final user = ref.watch(UserProvider.userState).user!;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Form(
        key: formKey,
        child: AlertDialog(
          title: const Text('Add users'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 10,
                children: _users
                    .map(
                      (e) => Chip(
                        avatar: CircleAvatar(
                          foregroundImage: Image.file(
                            e.photo,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                          ).image,
                          child: const Icon(Icons.photo),
                        ),
                        label: Text(e.email),
                        onDeleted: e.id != user.id
                            ? () {
                                projectsManager.removeParticipant(e);
                              }
                            : null,
                      ),
                    )
                    .toList(),
              ),
              TextFormField(
                controller: participantFieldController,
                autofocus: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Fill field';
                  }
                  if (val.isNotEmpty && projectUser.value == null) {
                    return 'User not found';
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
                      projectsManager.addParticipant(participant);
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
                          projectsManager.addParticipant(participant);
                          participantFieldController.clear();
                        }
                      } catch (err) {
                        formKey.currentState?.validate();
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
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
