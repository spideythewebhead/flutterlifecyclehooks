import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';

/// [LifecycleHooksSubscriber] wraps a widget [child] and proovides convient arguments for lifecycle hooks.
///
/// You can use this if you don't want to polute the namespace of a stateful widget.
class LifecycleHooksSubscriber extends StatefulWidget {
  const LifecycleHooksSubscriber({
    super.key,
    required this.child,
    this.onAppShow,
    this.onAppHide,
    this.onAppResume,
    this.onAppPause,
    this.onAppRestart,
    this.onAppInactive,
    this.onAppDetach,
    this.onAppLifecycleChange,
    this.onExitAppRequest,
  });

  final Widget child;
  final VoidCallback? onAppShow;
  final VoidCallback? onAppHide;
  final VoidCallback? onAppResume;
  final VoidCallback? onAppPause;
  final VoidCallback? onAppRestart;
  final VoidCallback? onAppInactive;
  final VoidCallback? onAppDetach;
  final ValueChanged<AppLifecycleState>? onAppLifecycleChange;
  final Future<AppExitResponse> Function()? onExitAppRequest;

  @override
  State<LifecycleHooksSubscriber> createState() =>
      _LifecycleHooksSubscriberState();
}

class _LifecycleHooksSubscriberState extends State<LifecycleHooksSubscriber>
    with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void onContextReady() {}

  @override
  void onAppShow() => widget.onAppShow?.call();

  @override
  void onAppHide() => widget.onAppHide?.call();

  @override
  void onAppResume() => widget.onAppResume?.call();

  @override
  void onAppPause() => widget.onAppPause?.call();

  @override
  void onAppRestart() => widget.onAppRestart?.call();

  @override
  void onAppInactive() => widget.onAppInactive?.call();

  @override
  void onAppDetach() => widget.onAppDetach?.call();

  @override
  void onAppLifecycleChange(AppLifecycleState state) =>
      widget.onAppLifecycleChange?.call(state);

  @override
  Future<AppExitResponse> onExitAppRequest() =>
      widget.onExitAppRequest?.call() ?? super.onExitAppRequest();
}
