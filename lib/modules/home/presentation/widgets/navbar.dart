import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/presentation/projects_page.dart';
import 'package:postgresUn/modules/tasks/presentation/tasks_page.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class NavBar extends HookConsumerWidget {
  const NavBar({
    Key? key,
    required this.pageController,
    required this.user,
  }) : super(key: key);

  final StreamController pageController;
  final User user;

  @override
  Widget build(context, ref) {
    final userManager = ref.watch(UserProvider.userManager);
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              pageController.add(ProjectsPage.route);
            },
            child: Text('Projects'),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              pageController.add(TasksPage.route);
            },
            child: Text('Tasks'),
          ),
          const Spacer(),
          Text('${user.lastName} ${user.name} ${user.patronymic}'),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: userManager.signOut,
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
