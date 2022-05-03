import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/constants.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/tasks/presentation/dialog_task.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_page.dart';

class ProjectPage extends StatefulHookConsumerWidget {
  static const route = 'project';
  const ProjectPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProjectPageState();
}

class ProjectPageState extends ConsumerState<ProjectPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final projectId = ModalRoute.of(context)?.settings.arguments as int;
      ref.watch(ProjectsProvider.projectManagerProvider).onInit(projectId);
    });
  }

  @override
  void dispose() {
    // ref.r
    // ref.onDispose(
    //   () => ref.watch(ProjectsProvider.projectManagerProvider).onDispose(),
    // );
    // ref.watch(ProjectsProvider.projectManagerProvider).onDispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final tabs = [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const DialogTask();
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          const TasksTabButton(),
        ],
      ),
      // const Tab(
      //   child: Text('Chat'),
      // ),
      // const Tab(
      //   child: Text('Participants'),
      // ),
    ];
    final tabsController = useTabController(initialLength: tabs.length);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const ProjectPageTitle(),
            const SizedBox(width: 100),
            Expanded(
              child: TabBar(
                isScrollable: true,
                controller: tabsController,
                tabs: tabs,
              ),
            )
          ],
        ),
        actions: const [ProjectPageActions()],
        // centerTitle: true,
      ),
      body: Padding(
        padding: AppConstants.bodyPadding,
        child: TabBarView(
          controller: tabsController,
          children: const [
            TasksPage(),
            // Messages(),
            // ProjectParticipants(),
          ],
        ),
      ),
    );
  }
}

class ProjectPageActions extends HookConsumerWidget {
  const ProjectPageActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(UserProvider.userState).user!;
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);

    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );

    if (project == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          if (project.admins!.any((element) => element.id == user.id))
            PopupMenuItem(
              value: 0,
              onTap: () {
                projectsManager.delete(project);
                Navigator.pop(context);
              },
              child: const Text('Delete project'),
            )
        ];
      },
    );
  }
}

class ProjectPageTitle extends HookConsumerWidget {
  const ProjectPageTitle({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );

    if (project == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Text(project.title);
  }
}

class TasksTabButton extends HookConsumerWidget {
  const TasksTabButton({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );
    if (project == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Text('Tasks (${project.countDoneTasks}/${project.countTasks})');
  }
}
