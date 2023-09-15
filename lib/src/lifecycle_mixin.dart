import 'dart:ui';

import 'package:flutter/widgets.dart';

/// A mixin that can be used on [StatefulWidget]s.
///
/// Uses [AppLifecycleListener] and handles de/registering itself.
///
/// Override [onContextReady] as alternative of [initState] to have context ready.
///
/// Also to synchronously obtain the lifecycle you can call [currentLifecycleState].
mixin LifecycleMixin<T extends StatefulWidget> on State<T> {
  bool _didRunOnContextReady = false;
  AppLifecycleListener? _appLifecycleListener;

  AppLifecycleState? get currentLifecycleState =>
      _appLifecycleListener?.binding.lifecycleState ??
      WidgetsBinding.instance.lifecycleState;

  @override
  void initState() {
    super.initState();
    _appLifecycleListener = AppLifecycleListener(
      onShow: onAppShow,
      onHide: onAppHide,
      onRestart: onAppRestart,
      onResume: onAppResume,
      onPause: onAppPause,
      onInactive: onAppInactive,
      onDetach: onAppDetach,
      onStateChange: onAppLifecycleChange,
      onExitRequested: onExitAppRequest,
    );
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
    _appLifecycleListener?.dispose();
    super.dispose();
  }

  /// Runs the first time [didChangeDependencies] is called.
  ///
  /// In case you have other mixins which override [didChangeDependencies]
  /// add this mixin as the last mixin in the list.
  void onContextReady() {}

  void onAppShow() {}

  void onAppHide() {}

  void onAppResume() {}

  void onAppPause() {}

  void onAppRestart() {}

  void onAppInactive() {}

  void onAppDetach() {}

  void onAppLifecycleChange(AppLifecycleState state) {}

  Future<AppExitResponse> onExitAppRequest() async => AppExitResponse.exit;
}
