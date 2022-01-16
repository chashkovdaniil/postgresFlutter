import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TasksPage extends HookConsumerWidget {
  static const route = 'tasks';
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Container(
      child: Text('Tasks'),
    );
  }
}
