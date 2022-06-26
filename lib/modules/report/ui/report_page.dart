import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/messages/messages_providers.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:searchfield/searchfield.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/modules/participants/participants_provider.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_state.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/tasks/tasks_provider.dart';

class ReportPage extends ConsumerStatefulWidget {
  static const routeName = '/report';
  const ReportPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends ConsumerState<ReportPage> {
  final nameReportFieldController = TextEditingController();
  DateTimeRange? dateRange;
  User? forUser;
  bool showProjectInfo = true;
  bool showUsers = true;
  bool showTasks = true;
  List<Task>? tasks;
  List<ProjectUser>? participants;
  List<Message>? messages;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameReportFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser =
        ref.watch(UserProvider.userState.select((value) => value.user));
    final project = ref.watch(
      ProjectsProvider.projectStateProvider
          .select((value) => value.currentProject),
    );
    tasks = ref.watch(
      ProjectsProvider.projectStateProvider.select((value) => value.tasks),
    );
    participants = ref.watch(
      ProjectsProvider.projectStateProvider
          .select((value) => value.participants),
    );

    messages = ref.watch(
      ProjectsProvider.projectStateProvider.select((value) => value.messages),
    );
    if (messages == null) {
      final messagesManager = ref.watch(
        MessagesProviders.messagesManagerProvider,
      );
      messagesManager.onInit();
    }

    if (tasks == null) {
      final tasksManager = ref.watch(TasksProvider.tasksManagerProvider);
      tasksManager.onInit();
    }
    if (participants == null) {
      final participantsManager =
          ref.watch(ParticipantProvider.participantsManagerProvider);
      participantsManager.onInit();
    }
    if (dateRange != null) {
      if (tasks != null) {
        tasks = tasks!
            .where(
              (element) =>
                  element.createdAt.isBefore(dateRange!.end) &&
                  element.createdAt.isAfter(dateRange!.start),
            )
            .toList();
      }

      if (messages != null) {
        messages = messages!
            .where(
              (element) =>
                  element.timestamp.isBefore(dateRange!.end) &&
                  element.timestamp.isAfter(dateRange!.start),
            )
            .toList();
      }
    }

    if (project == null || tasks == null) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final report = <String>[];
    final startDate = dateRange?.start == null
        ? '[Выберите период]'
        : '${dateRange?.start.day}.${dateRange?.start.month}.${dateRange?.start.year}';
    final endDate = dateRange?.end == null
        ? '[Выберите период]'
        : '${dateRange?.end.day}.${dateRange?.end.month}.${dateRange?.end.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Отчет'),
        bottom: PreferredSize(
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Название'),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameReportFieldController,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Для кого отчет'),
              ),
              SizedBox(
                width: 300,
                child: FutureBuilder<List<User>>(
                  future: ref.watch(UserProvider.userRepository).users(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      return const CircularProgressIndicator();
                    }
                    final users = snapshot.data ?? [];
                    return SearchField<User>(
                      suggestions: [
                        for (var user in users)
                          SearchFieldListItem(
                            '${user.fullname} ${user.email}',
                            child: Text('${user.fullname} ${user.email}'),
                            item: user,
                          ),
                      ],
                      onSuggestionTap: (SearchFieldListItem<User> value) {
                        setState(() {
                          forUser = value.item;
                        });
                      },
                      suggestionState: Suggestion.hidden,
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Данные о проекте'),
              ),
              Switch(
                value: showProjectInfo,
                onChanged: (val) => setState(() {
                  showProjectInfo = val;
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Участники'),
              ),
              Switch(
                value: showUsers,
                onChanged: (val) => setState(() {
                  showUsers = val;
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Задачи'),
              ),
              Switch(
                value: showTasks,
                onChanged: (val) => setState(() {
                  showTasks = val;
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Период: с $startDate по $endDate'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final selectedRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    currentDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    helpText: 'Выберите период отчета',
                    saveText: 'Сохранить',
                  );
                  if (selectedRange != null) {
                    setState(() {
                      dateRange = selectedRange;
                    });
                  }
                },
                child: const Text('Выбрать период'),
              ),
            ],
          ),
          preferredSize: const Size.fromHeight(60),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (showProjectInfo)
              ReportPageProject(
                project: project,
                tasks: tasks ?? [],
              ),
            if (showUsers)
              ReportPageParticipants(
                participants: participants ?? [],
                tasks: tasks ?? [],
                messages: messages ?? [],
              ),
            if (showTasks) ReportPageTasks(tasks: tasks ?? []),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (forUser == null ||
              dateRange == null ||
              nameReportFieldController.text.isEmpty) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Ошибка'),
                content: const Text(
                  'Не выбран период либо пользователь для отчета,а может не указано название отчета',
                ),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Закрыть'),
                  ),
                ],
              ),
            );
            return;
          }

          report
            ..add(nameReportFieldController.text)
            ..add(
              'Период,'
              '${dateRange!.start.day}.${dateRange!.start.month}.${dateRange!.start.year},'
              '${dateRange!.end.day}.${dateRange!.end.month}.${dateRange!.end.year}',
            )
            ..add(
              'Отчет подготовил ${currentUser!.fullname} для ${forUser!.fullname}',
            )
            ..add('');
          if (showProjectInfo) {
            _addProjectIInfo(tasks ?? [], report, project);
          }
          if (showTasks) {
            _addTasks(tasks ?? [], report, project);
          }
          if (showUsers) {
            _addParticipants(participants ?? [], report, project);
          }
          final path = await FilePicker.platform.saveFile(
            dialogTitle: 'Сохранение отчета',
            fileName: 'Report.csv',
          );
          if (path == null) return;

          final file = File(path);
          final output = await file.writeAsString(
            report.join('\n'),
            mode: FileMode.writeOnly,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Сохранено ${path}'),
            ),
          );
        },
        label: const Text('Сохранить'),
      ),
    );
  }

  void _addProjectIInfo(
      List<Task> tasks, List<String> report, Project project) {
    double budgetResult;
    final doneTasks = tasks.where((t) => t.isDone);
    if (doneTasks.isEmpty) {
      budgetResult = 0.0;
    } else {
      budgetResult = doneTasks
          .map((e) => e.cost)
          .reduce((value, element) => value + element);
    }
    report
      ..add('Данные о проекте')
      ..add(
        'Название ,Описание , Бюджет , Потрачено , Остаток , Всего заданий , Выполнено заданий',
      )
      ..add(
        [
          project.title.replaceAll('\n', ''),
          project.description.replaceAll('\n', ''),
          project.budget.toString(),
          budgetResult.toString(),
          (project.budget - budgetResult).toString(),
          project.countTasks.toString(),
          project.countDoneTasks.toString(),
        ].join(','),
      )
      ..add('');
  }

  void _addTasks(List<Task> tasks, List<String> report, Project project) {
    report
      ..add(
        'Задачи',
      )
      ..add(
        [
          'Название',
          'Описание',
          'Статус',
          'Затраты',
          'Создатель',
          'Исполнитель',
        ].join(','),
      );
    for (final task in tasks) {
      report.add(
        [
          task.title.replaceAll('\n', ''),
          task.description.replaceAll('\n', ''),
          task.isDone ? 'Выполнено' : '-',
          task.cost.toString(),
          task.creator.fullname,
          task.performer.fullname,
        ].join(','),
      );
    }
    report.add('');
  }

  void _addParticipants(
      List<ProjectUser> participants, List<String> report, Project project) {
    report
      ..add(
        'Участники',
      )
      ..add(
        [
          'ФИО',
          'Email',
          'Телефон',
          'Должность',
          'Кол-во заданий',
          'Кол-во сообщений',
        ].join(','),
      );
    for (final user in participants) {
      report.add(
        [
          '${user.lastName} ${user.name} ${user.patronymic}',
          user.email,
          user.phone.toString(),
          user.post ?? '',
          tasks
                  ?.where((element) => element.performer.id == user.id)
                  .length
                  .toString() ??
              [],
          messages
                  ?.where((element) => element.user.id == user.id)
                  .length
                  .toString() ??
              [],
        ].join(','),
      );
    }
    report.add('');
  }
}

class ReportPageTasks extends HookConsumerWidget {
  final List<Task> tasks;
  const ReportPageTasks({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final titles = [
      const _TableTitle('ID'),
      const _TableTitle('Название'),
      const _TableTitle('Описание'),
      const _TableTitle('Статус'),
      const _TableTitle('Затраты'),
      const _TableTitle('Создатель'),
      const _TableTitle('Исполнитель'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        _Table(
          label: 'Задачи',
          titles: titles,
          rows: tasks == null
              ? []
              : [
                  for (var task in tasks)
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      children: [
                        _TableCol(task.id.toString()),
                        Text(task.title),
                        Text(task.description),
                        Text(task.isDone ? 'Выполнено' : '-'),
                        Text(task.cost.toString()),
                        Text(task.creator.fullname),
                        Text(task.performer.fullname),
                      ],
                    ),
                ],
        ),
      ],
    );
  }
}

class ReportPageParticipants extends HookConsumerWidget {
  final List<ProjectUser> participants;
  final List<Task> tasks;
  final List<Message> messages;
  const ReportPageParticipants({
    required this.participants,
    required this.messages,
    required this.tasks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final titles = [
      const _TableTitle('ID'),
      const _TableTitle('ФИО'),
      const _TableTitle('Email'),
      const _TableTitle('Телефон'),
      const _TableTitle('Должность'),
      const _TableTitle('Кол-во задач'),
      const _TableTitle('Кол-во сообщений'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        _Table(
          label: 'Участники',
          titles: titles,
          rows: participants == null
              ? []
              : [
                  for (var user in participants)
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      children: [
                        _TableCol(user.id.toString()),
                        Text(
                            '${user.lastName} ${user.name} ${user.patronymic}'),
                        Text(user.email),
                        Text(user.phone.toString()),
                        Text(user.post ?? ''),
                        Text(
                          tasks
                              .where((t) => t.performer.id == user.id)
                              .length
                              .toString(),
                        ),
                        Text(
                          messages
                              .where((m) => m.user.id == user.id)
                              .length
                              .toString(),
                        ),
                      ],
                    ),
                ],
        ),
      ],
    );
  }
}

class ReportPageProject extends HookConsumerWidget {
  final Project project;
  final List<Task> tasks;
  const ReportPageProject({
    required this.project,
    required this.tasks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final titles = [
      const _TableTitle('ID'),
      const _TableTitle('Название'),
      const _TableTitle('Описание'),
      const _TableTitle('Бюджет'),
      const _TableTitle('Потрачено'),
      const _TableTitle('Остаток'),
      const _TableTitle('Всего заданий'),
      const _TableTitle('Выполнено заданий'),
    ];

    double budgetResult;
    final doneTasks = tasks.where((t) => t.isDone);
    if (doneTasks.isEmpty) {
      budgetResult = 0.0;
    } else {
      final costs = doneTasks.map((e) => e.cost);
      budgetResult = costs.reduce((value, element) => value + element);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        _Table(
          label: 'Проект',
          titles: titles,
          rows: [
            TableRow(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              children: [
                _TableCol(project.id.toString()),
                _TableCol(project.title),
                _TableCol(project.description),
                _TableCol(project.budget.toString()),
                _TableCol(budgetResult.toString()),
                _TableCol((project.budget - budgetResult).toString()),
                _TableCol(project.countTasks.toString()),
                _TableCol(project.countDoneTasks.toString()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _TableCol extends StatelessWidget {
  final String content;
  const _TableCol(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(content),
    );
  }
}

class _Table extends StatelessWidget {
  final String label;
  final List<Widget> titles;
  final List<TableRow> rows;
  const _Table({
    Key? key,
    required this.label,
    required this.titles,
    required this.rows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(label),
        ),
        Table(
          border: const TableBorder(
            right: BorderSide(),
            verticalInside: BorderSide(),
          ),
          columnWidths: {
            0: const IntrinsicColumnWidth(),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              children: titles,
            ),
            ...rows,
          ],
        ),
      ],
    );
  }
}

class _TableTitle extends StatelessWidget {
  final String title;
  const _TableTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    );
  }
}
