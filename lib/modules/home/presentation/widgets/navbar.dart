import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/projects/presentation/projects_page.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class NavBar extends HookConsumerWidget {
  final String title;
  final List<Widget> actions;
  const NavBar({
    Key? key,
    this.title = '',
    this.actions = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(UserProvider.userState).user!;
    final userManager = ref.watch(UserProvider.userManager);

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(width: 20),
            ...actions,
            const Spacer(),
            CircleAvatar(
              backgroundColor: Colors.red,
              foregroundImage: Image.file(user.photo).image,
            ),
            const SizedBox(width: 10),
            Text(user.fullname),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: userManager.signOut,
              child: Row(
                children: const [
                  Text('Sign out'),
                  SizedBox(width: 8),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
