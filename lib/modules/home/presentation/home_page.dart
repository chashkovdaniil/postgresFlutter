import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/home/presentation/widgets/navbar.dart';
import 'package:postgresUn/modules/projects/presentation/projects_page.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_page.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/home';

  @override
  Widget build(context, ref) {
    final pagesRoutes = [
      ProjectsPage.route,
      TasksPage.route,
    ];
    final pages = [
      const ProjectsPage(),
      const TasksPage(),
    ];
    final user = ref.watch(UserProvider.userState).user!;
    final pageController = useStreamController<String>();
    final pageStream = useStream<String>(
      pageController.stream,
      initialData: pagesRoutes.first,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NavBar(pageController: pageController, user: user),
            Expanded(
              child: IndexedStack(
                index: pagesRoutes.indexOf(pageStream.data!),
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
