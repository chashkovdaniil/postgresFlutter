import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/main.dart';
import 'package:postgresUn/modules/app_loader/app_loader_providers.dart';
import 'package:postgresUn/modules/app_loader/domain/app_loader_state.dart';

import 'app_loading_page.dart';

class AppLoaderPage extends HookConsumerWidget {
  static const routeName = 'appLoader';
  const AppLoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final appLoaderManager = ref.watch(AppLoaderProviders.appLoaderManager);
    final appLoaderState = ref.watch(AppLoaderProviders.appLoaderState);
    useEffect(
      () {
        appLoaderManager.init();
        return null;
      },
      const [],
    );
    if (appLoaderState is AppLoadingState) {
      return const AppLoadingPage();
    }
    return const MainPage();
  }
}
