import 'package:flutter/material.dart';

class AppLoadingPage extends StatelessWidget {
  static const routeName = 'appLoading';
  const AppLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
