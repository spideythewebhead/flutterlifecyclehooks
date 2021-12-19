import 'package:flutter/material.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

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
  void onContextReady() {
    /// get your provider or other context dependant
    debugPrint('on context ready => $context');
  }

  @override
  void onPause() {
    debugPrint('did pause');
  }

  @override
  void onResume() {
    debugPrint('did resume');
  }

  @override
  void onDetached() {
    debugPrint('detached');
  }
}
