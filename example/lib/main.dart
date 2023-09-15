import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentLifecycleState.toString(),
              ),
              const SimpleWidget(),
            ],
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
  void onAppShow() {
    debugPrint('did show');
  }

  @override
  void onAppHide() {
    debugPrint('did hide');
  }

  @override
  void onAppResume() {
    debugPrint('did resume');
  }

  @override
  void onAppPause() {
    debugPrint('did pause');
  }

  @override
  void onAppInactive() {
    debugPrint('app inactive');
  }

  @override
  void onAppRestart() {
    debugPrint('app restarted');
  }

  @override
  void onAppDetach() {
    debugPrint('app detached');
  }

  @override
  Future<AppExitResponse> onExitAppRequest() {
    debugPrint('on app exit request');
    return super.onExitAppRequest();
  }
}

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LifecycleHooksSubscriber(
      onAppResume: () =>
          debugPrint('onAppResume from SimpleWidget LifecycleHooksSubscriber'),
      child: const Text('SimpleWidget'),
    );
  }
}
