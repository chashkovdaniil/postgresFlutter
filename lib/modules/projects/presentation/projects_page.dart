import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/constants.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/core/widgets/header_page.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/project_page.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_manager.dart';

class ProjectsPage extends HookConsumerWidget {
  static const route = 'projects';
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    useEffect(
      // ignore: unnecessary_lambdas
      () {
        projectsManager.projects();
      },
      const [],
    );
    final projectsState = ref.watch(ProjectsProvider.projectsState);
    if (projectsState.projects == null) {
      return const Center(
        child: Text('Projects not found'),
      );
    }
    final projects = projectsState.projects!.reversed.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderPage(
          title: 'Projects',
          actions: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CreateProjectDialog();
                  },
                );
              },
              child: const Text('Create'),
            ),
          ],
        ),
        if (projects.isNotEmpty)
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                mainAxisExtent: 50,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(projects[index].id),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProjectPage.route,
                      arguments: projects[index],
                    );
                  },
                  title: Text(projects[index].title),
                );
              },
            ),
          ),
      ],
    );
  }
}

class CreateProjectDialog extends HookConsumerWidget {
  const CreateProjectDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(UserProvider.userState).user;
    final manager = ref.watch(ProjectsProvider.projectsManager);
    final formKey = GlobalKey<FormState>(debugLabel: 'createProjectForm');
    final titleFieldController = useTextEditingController();
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text(
          'Create project',
          // style: Theme.of(context).textTheme.headline6,
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleFieldController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Fill field';
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                final users = {
                  ProjectUser.fromUser(user!, ProjectUserRoles.admin)
                };
                final startProject = StartProject(
                  title: titleFieldController.text,
                  users: users,
                  admins: users,
                );
                manager.create(startProject);
                Navigator.pop(context);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
