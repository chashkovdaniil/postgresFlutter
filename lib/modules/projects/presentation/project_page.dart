import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/constants.dart';
import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/report/ui/report_page.dart';
import 'package:postgresUn/modules/tasks/presentation/dialog_task.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_page.dart';

import '../../../core/widgets/loading_widget.dart';
import '../../messages/presentation/messages_page.dart';
import '../../participants/presentation/participants_page.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final projectId = ModalRoute.of(context)?.settings.arguments as int;
      ref.watch(ProjectsProvider.projectManagerProvider).onInit(projectId);
    });
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
      const Tab(
        child: Text('Чат'),
      ),
      const Tab(
        child: Text('Участники'),
      ),
    ];
    final tabsController = useTabController(initialLength: tabs.length);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
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
            MessagesPage(),
            ParticipantsPage(),
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
    final projectManager = ref.watch(ProjectsProvider.projectManagerProvider);

    final project = ref.watch(
      ProjectsProvider.projectStateProvider.select((s) => s.currentProject),
    );

    if (project == null) {
      return const SizedBox.shrink();
    }
    final items = [
      PopupMenuItem(
        value: 'openDescription',
        onTap: () => _openChangeBudget(context, project.budget, (newBudget) {
          projectManager.updateProjectInfo(budget: newBudget);
        }),
        child: Text('Изменить бюджет'),
      ),
      PopupMenuItem(
        value: 'openDescription',
        onTap: () => _openReport(context),
        child: Text('Создать отчёт по проекту'),
      ),
      PopupMenuItem(
        value: 'openDescription',
        onTap: () => _openDialogDescription(context, project.description),
        child: Text('Читать описание'),
      ),
      if (project.admins!.any((element) => element.id == user.id))
        PopupMenuItem(
          value: 0,
          onTap: () {
            projectsManager.delete(project);
            Navigator.pop(context);
          },
          child: const Text('Удалить проект'),
        )
    ];
    return items.isEmpty
        ? const SizedBox.shrink()
        : PopupMenuButton(
            itemBuilder: (context) {
              return items;
            },
          );
  }

  void _openDialogDescription(BuildContext context, String description) {
    Future.delayed(
      Duration.zero,
      () => showGeneralDialog(
        context: context,
        pageBuilder: (context, __, ___) => AlertDialog(
          title: Text('Описание проекта'),
          content: SingleChildScrollView(
            child: Text(description),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('Закрыть'),
            ),
          ],
        ),
      ),
    );
  }

  void _openChangeBudget(
    BuildContext context,
    double budget,
    ValueChanged<double> onChanged,
  ) {
    Future.delayed(
      Duration.zero,
      () => showGeneralDialog(
        context: context,
        pageBuilder: (context, __, ___) => AlertDialog(
          title: Text('Редактировать бюджет'),
          content: SingleChildScrollView(
            child: TextFormField(
              initialValue: budget.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+\.?[0-9]?')),
              ],
              onChanged: (val) {
                onChanged(double.parse(val.isEmpty ? budget.toString() : val));
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('Закрыть'),
            ),
          ],
        ),
      ),
    );
  }

  void _openReport(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ReportPage(),
        ),
      ),
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
      return const Center(child: LoadingWidget());
    }
    return Text('${project.title} (бюджет: ${project.budget}₽)');
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
      return const Center(
        child: LoadingWidget(
          height: 15,
        ),
      );
    }
    return Text('Задачи (${project.countDoneTasks}/${project.countTasks})');
  }
}
