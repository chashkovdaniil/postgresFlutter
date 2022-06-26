import 'package:riverpod/riverpod.dart';

abstract class AppState {
  const AppState();
}

class AppLoadedState extends AppState {
  const AppLoadedState();
}

class AppLoadingState extends AppState {
  const AppLoadingState();
}

class AppLoaderState extends StateNotifier<AppState> {
  AppLoaderState([AppState state = const AppLoadingState()]) : super(state);

  loading() {
    state = const AppLoadingState();
  }

  loaded() {
    state = const AppLoadedState();
  }
}
