import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/constants.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';

class ProjectPage extends HookConsumerWidget {
  static const route = 'project';
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final args = ModalRoute.of(context)?.settings.arguments as Project?;
    if (args == null) {
      return const Center(child: Text('Project not found'));
    }

    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    useEffect(
      () {
        projectsManager.project(args.id.toString());
        return;
      },
      const [],
    );
    final project = ref.watch(ProjectsProvider.projectsState).currentProject;
    if (project == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = ref.watch(UserProvider.userState).user!;
    final creator = project.creator!;
    final tabsController = useTabController(initialLength: 2);
    final tabs = [
      const Tab(
        child: Text('Tasks'),
      ),
      const Tab(
        child: Text('Participants'),
      ),
    ];
    final manager = ref.watch(ProjectsProvider.projectsManager);
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (user.id == creator.id)
                ? ElevatedButton(
                    onPressed: () {
                      manager.delete(project);
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  )
                : null,
          ),
        ],
        // centerTitle: true,
      ),
      body: Padding(
        padding: AppConstants.bodyPadding,
        child: Column(
          children: [
            TabBar(
              controller: tabsController,
              tabs: tabs,
            ),
            Expanded(
              child: TabBarView(
                controller: tabsController,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return const ListTile();
                    },
                  ),
                  ProjectParticipants(
                    project: project,
                    user: user,
                    creator: creator,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectParticipants extends StatelessWidget {
  const ProjectParticipants({
    Key? key,
    required this.project,
    required this.user,
    required this.creator,
  }) : super(key: key);

  final Project project;
  final User user;
  final ProjectUser creator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
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
            itemCount: project.participants!.length,
            itemBuilder: (context, index) {
              final participant = project.participants!.elementAt(index);
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
                    if (participant.id == project.creator!.id)
                      const Icon(
                        Icons.star,
                      ),
                  ],
                ),
                trailing: (project.creator!.id == user.id)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (creator.id != participant.id)
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                            ),
                          IconButton(
                            onPressed: () {},
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
    final _participants = project.participants ?? Set<ProjectUser>.identity();
    final participantFieldController = useTextEditingController();
    final formKey = GlobalKey<FormState>(debugLabel: 'addParticipantsForm');
    final projectUser = useState<User?>(null);
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Form(
        key: formKey,
        child: AlertDialog(
          title: const Text('Add participants'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 10,
                children: _participants
                    .map(
                      (e) => Chip(
                        avatar: const CircleAvatar(),
                        label: Text(e.email),
                        onDeleted: () {
                          projectsManager.removeParticipant(e);
                        },
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
