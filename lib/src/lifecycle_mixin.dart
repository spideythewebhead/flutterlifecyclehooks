import 'package:flutter/widgets.dart';

/// A mixin that can be used on [StatefulWidget]s.
/// Implements [WidgetsBindingObserver] and handles de/registering by itself.
/// Must implement [onResume] and [onPause].
/// Override [onContextReady] as alternative to initState to have context ready
/// Also to synchronously obtain the lifecycle you can call [currentLifecycleState]
mixin LifecycleMixin<T extends StatefulWidget> on State<T>
    implements WidgetsBindingObserver {
  var _didRunOnContextReady = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        return;
      case AppLifecycleState.inactive:
        onInactive();
        return;
      case AppLifecycleState.paused:
        onPause();
        return;
      case AppLifecycleState.detached:
        onDetached();
        return;
    }
  }

  AppLifecycleState? get currentLifecycleState =>
      WidgetsBinding.instance.lifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didRunOnContextReady) {
      _didRunOnContextReady = true;
      onContextReady();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// runs the first time [didChangeDependencies] is called
  /// in case you have other mixins which override [didChangeDependencies]
  /// add this mixin as the last mixin in the list
  void onContextReady() {}

  void onResume();

  void onInactive() {}

  void onPause();

  void onDetached() {}

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? locales) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}

  @override
  Future<bool> didPopRoute() {
    return Future.value(false);
  }

  @override
  Future<bool> didPushRoute(String route) {
    return Future.value(false);
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    return Future.value(false);
  }
}
