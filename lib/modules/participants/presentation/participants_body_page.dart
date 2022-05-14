import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/projects_provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../projects/domain/entities/project_user.dart';
import '../participants_provider.dart';

class ParticipantsBodyPage extends ConsumerWidget {
  const ParticipantsBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final participantsManager = ref.watch(
      ParticipantProvider.participantsManagerProvider,
    );
    final projectState = ref.watch(ProjectsProvider.projectStateProvider);
    final project = projectState.currentProject;
    final user = ref.watch(UserProvider.userState).user;

    if (project == null || user == null) {
      return const CircularProgressIndicator();
    }

    final isAllowedAdmin = projectState.isAllowedAdmin;
    final participants = projectState.participants;

    if (participants == null) {
      return const Center(child: CircularProgressIndicator());
    }
    participants.removeWhere((element) => element.id == 0);

    return ListView.builder(
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final participant = participants.elementAt(index);
        final participantFullnameAndEmail = Text(
          '${participant.lastName} '
          '${participant.name} '
          '${participant.patronymic} '
          '(${participant.email})',
        );

        return ListTile(
          key: ValueKey(participant.id),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            foregroundImage: Image.file(
              participant.photo,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ).image,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              participantFullnameAndEmail,
              if (participant.role == ProjectUserRoles.admin)
                const Icon(Icons.star),
            ],
          ),
          trailing: isAllowedAdmin && participant.id != user.id
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.star),
                    // ),
                    IconButton(
                      onPressed: () => participantsManager.removeParticipant(
                        project,
                        participant,
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
