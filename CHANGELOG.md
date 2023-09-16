### 4.0.0

- Migrated from `WidgetsBindingObserver` to `AppLifecycleListener`.
- Introduced [`LifecycleHooksSubscriber`](https://github.com/spideythewebhead/flutterlifecyclehooks/blob/master/lib/src/lifecycle_hooks_subscriber.dart) 
  as an alternative to the mixin.
- Updated dependencies.

### 3.0.2

- Support Flutter 3.10.0

### 3.0.1

- Add onInactive callback for AppLifecycleState.inactive

### 3.0.0

- Support Flutter 3.0.0

### 2.0.0

Breaking change

- removed afterFirstRender use onContextReady
- stable null safety
- update readme

### 2.0.0-nullsafety.0

- Migrate to null safety
- Provide onContextReady callback [replacement for afterFirstRender]
- Update unit tests
- Update example

### 1.0.1

- prodive default implementation for `didPushRouteInformation` for Flutter v1.22.\*

### 1.0.0

- added onDetached

### 0.0.2

- added unit tests
- set minimum flutter version 1.12.0

### 0.0.1

- package first release
