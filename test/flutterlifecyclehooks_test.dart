import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:mockito/mockito.dart';

import 'mock_lifecycle_mixin_impl.dart';

void main() {
  testWidgets('current lifecycle state resumed', (tester) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpWidget(const _App());
    expect(find.text(AppLifecycleState.resumed.toString()), findsOneWidget);
  });

  testWidgets('verify onPause and onResume called', (tester) async {
    final mockLifecycle = MockLifecycle();

    await tester.pumpWidget(_App(mockLifecycle: mockLifecycle));

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);

    verify(mockLifecycle.onPause()).called(1);
    verify(mockLifecycle.onResume()).called(1);
  });

  testWidgets('verify onInactive called', (tester) async {
    final mockLifecycle = MockLifecycle();

    await tester.pumpWidget(_App(mockLifecycle: mockLifecycle));

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);

    verify(mockLifecycle.onInactive()).called(1);
  });

  testWidgets('verify onDetached called', (tester) async {
    final mockLifecycle = MockLifecycle();

    await tester.pumpWidget(_App(mockLifecycle: mockLifecycle));

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.detached);

    verify(mockLifecycle.onDetached()).called(1);
  });

  testWidgets('verify onContextReady called', (tester) async {
    final mockLifecycle = MockLifecycle();

    /// change the lifecycle state from [AppLifecycleState.detatched] (see previous test)
    ///  because the test otherwise fails
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);

    await tester.pumpWidget(_App(mockLifecycle: mockLifecycle));

    verify(mockLifecycle.onContextReady()).called(1);
  });
}

class _App extends StatefulWidget {
  final MockLifecycle? mockLifecycle;

  const _App({
    Key? key,
    this.mockLifecycle,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<_App> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text(
          currentLifecycleState.toString(),
        ),
      ),
    );
  }

  @override
  void onContextReady() {
    widget.mockLifecycle?.onContextReady();
  }

  @override
  void onResume() {
    widget.mockLifecycle?.onResume();
  }

  @override
  void onInactive() {
    widget.mockLifecycle?.onInactive();
  }

  @override
  void onPause() {
    widget.mockLifecycle?.onPause();
  }

  @override
  void onDetached() {
    widget.mockLifecycle?.onDetached();
  }
}
