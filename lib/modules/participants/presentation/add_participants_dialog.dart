import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchfield/searchfield.dart';

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

    if (project == null) {
      return const CircularProgressIndicator();
    }

    final participantsManager =
        ref.watch(ParticipantProvider.participantsManagerProvider);
    final participantFieldController = useTextEditingController();
    final formKey = GlobalKey<FormState>(debugLabel: 'addParticipantsForm');

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
              SearchUser(
                onSelected: (user) {
                  try {
                    if (user != null) {
                      final participant = ProjectUser.fromUser(
                        user,
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
            label: Text(user.fullname),
            onDeleted: user.id == currentUser.id
                ? null
                : () => participantsManager.removeParticipant(project, user),
          ),
      ],
    );
  }
}

class SearchUser extends ConsumerStatefulWidget {
  final ValueChanged<User?> onSelected;
  final String? Function(String?)? validator;
  const SearchUser({
    Key? key,
    required this.onSelected,
    this.validator,
  }) : super(key: key);

  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends ConsumerState<SearchUser> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) => FutureBuilder<List<User>>(
        future: ref.read(UserProvider.userRepository).users(),
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const CircularProgressIndicator();
          }
          final users = snapshot.data ?? [];
          return SearchField<User>(
            hint: 'Введите ФИО пользователя',
            controller: textEditingController,
            suggestions: [
              for (var user in users)
                SearchFieldListItem(
                  '${user.fullname} ${user.email}',
                  child: Text('${user.fullname} ${user.email}'),
                  item: user,
                ),
            ],
            onSuggestionTap: (SearchFieldListItem<User> value) {
              textEditingController.clear();
              widget.onSelected(value.item);
            },
            validator: widget.validator,
            suggestionState: Suggestion.hidden,
          );
        },
      );
}
