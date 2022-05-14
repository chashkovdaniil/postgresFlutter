import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/modules/participants/participants_provider.dart';
import 'package:postgresUn/modules/participants/presentation/participants_body_page.dart';

import 'add_participants_dialog.dart';

class ParticipantsPage extends HookConsumerWidget {
  const ParticipantsPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final participantsManager =
        ref.watch(ParticipantProvider.participantsManagerProvider);
    useEffect(
      () {
        participantsManager.onInit();
        return null;
      },
      const [],
    );

    final isAllowedAdmin = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.isAllowedAdmin),
    );

    return Column(
      children: [
        const SizedBox(height: 10),
        if (isAllowedAdmin)
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddParticipantsDialog(),
              );
            },
            child: const Text('Add participant'),
          ),
        const Expanded(
          child: ParticipantsBodyPage(),
        ),
      ],
    );
  }
}
