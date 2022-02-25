import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/constants.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/dialog_task.dart';
import 'package:postgresUn/modules/projects/presentation/messages.dart';
import 'package:postgresUn/modules/projects/presentation/participants.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_manager.dart';
import 'package:postgresUn/modules/projects/presentation/tasks_tab.dart';

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

    final streamData = useStream(
      Stream.periodic(const Duration(milliseconds: 1000), (_) {
        projectsManager.project(args.id.toString());
        return _;
      }),
      initialData: 0,
    );
    final project = ref.watch(ProjectsProvider.projectsState).currentProject;
    if (project == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = ref.watch(UserProvider.userState).user!;
    final tabs = [
      Tab(
        icon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DialogTask(project: project);
              },
            );
          },
          icon: Icon(Icons.add),
        ),
        child: Text('Tasks (${project.countDoneTasks}/${project.countTasks})'),
      ),
      const Tab(
        child: Text('Chat'),
      ),
      const Tab(
        child: Text('Participants'),
      ),
    ];
    final tabsController = useTabController(initialLength: tabs.length);
    final manager = ref.watch(ProjectsProvider.projectsManager);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(project.title),
            const SizedBox(width: 100),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Expanded(
                child: TabBar(
                  controller: tabsController,
                  tabs: tabs,
                ),
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                if (project.admins!.any((element) => element.id == user.id))
                  PopupMenuItem(
                    value: 0,
                    onTap: () {
                      manager.delete(project);
                      Navigator.pop(context);
                    },
                    child: Text('Delete project'),
                  )
              ];
            },
          ),
        ],
        // centerTitle: true,
      ),
      body: Padding(
        padding: AppConstants.bodyPadding,
        child: Expanded(
          child: TabBarView(
            controller: tabsController,
            children: [
              if (project.tasks != null) Tasks(project: project),
              Messages(),
              ProjectParticipants(
                project: project,
                user: user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
