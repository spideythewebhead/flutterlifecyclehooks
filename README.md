# flutterlifecyclehooks

A flutter package that lets you easily add hooks for application lifecycle state
LifecycleMixin just implements the `WidgetsBindingObserver` and invokes the callbacks
`onResume`, `onPause`, `onDetached`, `afterFirstRender`, for you.
You can use the other callbacks provided by `WidgetsBindingObserver` https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html
You don't need to manually call onDispose to deregister.

## Getting Started

Add on pubspec.yaml  

dependencies:  
&nbsp;&nbsp;&nbsp;&nbsp;flutterlifecyclehooks: version

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
  void onPause() {
    print('did pause');
  }

  @override
  void onResume() {
    print('did resume');
  }
  
  /// optionally
  @override
  void afterFirstRender() {
    print('run after first render');
  }
}
```