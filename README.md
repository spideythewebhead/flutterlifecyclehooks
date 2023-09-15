# flutterlifecyclehooks

A flutter package that lets you easily add hooks for application lifecycle state.
[`LifecycleMixin`](/lib/src/lifecycle_mixin.dart) uses the `AppLifecycleListener` and registers methods as hooks.

The list of hooks is:

- onAppShow
- onAppHide
- onAppRestart
- onAppResume
- onAppPause
- onAppInactive
- onAppDetach
- onExitAppRequest

Note: _Read more about these lifecycle hooks https://api.flutter.dev/flutter/widgets/AppLifecycleListener-class.html_

Optionally provides `onContextReady` that acts like `initState` but `BuildContext` is available for use.

## Getting Started

Add on pubspec.yaml

```
dependencies:
    flutterlifecyclehooks: version
```

## Example code

```
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            currentLifecycleState.toString(),
          ),
        ),
      ),
    );
  }

  @override
  void onAppLifecycleChange(AppLifecycleState state) {
    setState(() {});
  }

  @override
  void onResume() {
    print('did resume');
  }

  @override
  void onPause() {
    print('did pause');
  }
}
```
---

Also you can use, [`LifecycleHooksSubscriber`](/lib/src/lifecycle_hooks_subscriber.dart) wraps a widget and provides convient arguments for lifecycle hooks.

You can use this if you don't want to polute the namespace of a stateful widget.