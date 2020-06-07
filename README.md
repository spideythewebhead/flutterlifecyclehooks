# flutterlifecyclehooks

A flutter package that let you easily add hooks for application lifecycle state

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