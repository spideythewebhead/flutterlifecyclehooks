// ignore_for_file: prefer_function_declarations_over_variables

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutterlifecyclehooks/src/_internal/lifecycle_mixin_interface.dart';

/// A mixin that can be used on [StatefulWidget]s.
///
/// Uses [AppLifecycleListener] and handles de/registering itself.
///
/// Override [onContextReady] as alternative of [initState] to have context ready.
///
/// Also to synchronously obtain the lifecycle you can call [currentLifecycleState].
mixin LifecycleMixin<T extends StatefulWidget> on State<T>
    implements LifecycleMixinInterface {
  bool _didRunOnContextReady = false;

  AppLifecycleState _lifecycleState = AppLifecycleState.resumed;

  @override
  AppLifecycleState? get currentLifecycleState => _lifecycleState;

  @override
  void initState() {
    super.initState();
    html.window
      ..addEventListener('focus', _onWindowFocused)
      ..addEventListener('blur', _onWindowBlur);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_didRunOnContextReady) {
      return;
    }

    _didRunOnContextReady = true;
    onContextReady();
  }

  @override
  void dispose() {
    html.window
      ..removeEventListener('focus', _onWindowFocused)
      ..removeEventListener('blur', _onWindowBlur);
    super.dispose();
  }

  @override
  void onContextReady() {}

  @override
  void onAppShow() {}

  @override
  void onAppHide() {}

  @override
  void onAppResume() {}

  @override
  void onAppPause() {}

  @override
  void onAppRestart() {}

  @override
  void onAppInactive() {}

  @override
  void onAppDetach() {}

  @override
  void onAppLifecycleChange(AppLifecycleState state) {}

  @override
  Future<AppExitResponse> onExitAppRequest() async => AppExitResponse.exit;

  late final _onWindowFocused = (html.Event event) {
    onAppLifecycleChange(_lifecycleState = AppLifecycleState.resumed);
    onAppResume();
  };

  late final _onWindowBlur = (html.Event event) {
    onAppLifecycleChange(_lifecycleState = AppLifecycleState.paused);
    onAppPause();
  };
}
