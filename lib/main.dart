import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgres/postgres.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/home/presentation/home_page.dart';
import 'package:postgresUn/modules/projects/presentation/project_page.dart';
import 'package:postgresUn/modules/users/presentation/login_page.dart';
import 'package:postgresUn/modules/users/presentation/register_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      routes: {
        MainPage.route: (_) => const MainPage(),
        HomePage.route: (_) => const HomePage(),
        LoginPage.route: (_) => const LoginPage(),
        RegisterPage.route: (_) => const RegisterPage(),
        ProjectPage.route: (_) => const ProjectPage(),
      },
      scrollBehavior: ScrollBehavior(),
    );
  }
}

class MainPage extends HookConsumerWidget {
  static const String route = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final userState = ref.watch(UserProvider.userState);
    if (userState.isAuth) {
      return const HomePage();
    }
    return const LoginPage();
  }
}
