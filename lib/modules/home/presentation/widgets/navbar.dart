import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/presentation/projects_page.dart';
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(user.fullname),
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
