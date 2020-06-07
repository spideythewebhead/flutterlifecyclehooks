import 'package:flutter/foundation.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:mockito/mockito.dart';

class MockLifecycle extends Mock implements LifecycleMixin {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MockLifecycle';
  }
}
