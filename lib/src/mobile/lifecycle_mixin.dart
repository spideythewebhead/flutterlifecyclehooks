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
  AppLifecycleListener? _appLifecycleListener;

  @override
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
}
