import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/home/presentation/widgets/navbar.dart';
import 'package:postgresUn/modules/projects/presentation/projects_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/home';

  @override
  Widget build(context, ref) {
    return ProjectsPage();
  }
}
