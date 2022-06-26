import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgres/postgres.dart';
import 'package:postgresUn/core/providers/service_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/app_loader/ui/app_loader_page.dart';
import 'package:postgresUn/modules/app_loader/ui/app_loading_page.dart';
import 'package:postgresUn/modules/home/presentation/home_page.dart';
import 'package:postgresUn/modules/projects/presentation/project_page.dart';
import 'package:postgresUn/modules/users/presentation/login_page.dart';
import 'package:postgresUn/modules/users/presentation/register_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
          secondary: Colors.white,
          onPrimary: Color(0xff393939),
          surface: Colors.white,
          onSurface: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.red.shade800;
              }

              return Colors.red;
            }),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        primarySwatch: Colors.red,
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
        AppLoadingPage.routeName: (_) => const AppLoadingPage(),
        AppLoaderPage.routeName: (_) => const AppLoaderPage(),
      },
      initialRoute: AppLoaderPage.routeName,
      scrollBehavior: const ScrollBehavior(),
    );
  }
}

class MainPage extends HookConsumerWidget {
  static const String route = '/main';
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
