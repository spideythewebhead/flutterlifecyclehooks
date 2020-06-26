import 'package:flutter/widgets.dart';

/// A mixin that can be used on [StatefulWidget]s.
/// Implements [WidgetsBindingObserver] and handles de/registering by itself.
/// Must implement [onResume] and [onPause].
/// Optionally override [afterFirstRender] to provide a callback
/// when in need to run something after the first render of the widget.
/// Also to synchronously obtain the lifecycle you can call [currentLifecycleState]
mixin LifecycleMixin<T extends StatefulWidget> on State<T>
    implements WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPause();
    } else if (state == AppLifecycleState.detached) {
      onDetached();
    }
  }

  AppLifecycleState get currentLifecycleState =>
      WidgetsBinding.instance.lifecycleState;

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale> locale) {}

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      afterFirstRender();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// you can override this to add a hook when the current frame ends
  void afterFirstRender() {}

  void onResume();

  void onPause();

  void onDetached() {}
}
