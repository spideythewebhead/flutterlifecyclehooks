import 'dart:ui';

abstract interface class LifecycleMixinInterface {
  AppLifecycleState? get currentLifecycleState;

  /// Runs the first time [didChangeDependencies] is called.
  ///
  /// In case you have other mixins which override [didChangeDependencies]
  /// add this mixin as the last mixin in the list.
  ///
  /// Platforms: `Mobile and Web`
  void onContextReady();

  /// Platforms: `Mobile`
  void onAppShow();

  /// Platforms: `Mobile`
  void onAppHide();

  /// Platforms: `Mobile and Web`
  void onAppResume();

  /// Platforms: `Mobile and Web`
  void onAppPause();

  /// Platforms: `Mobile`
  void onAppRestart();

  /// Platforms: `Mobile`
  void onAppInactive();

  /// Platforms: `Mobile`
  void onAppDetach();

  void onAppLifecycleChange(AppLifecycleState state);

  /// Platforms: `Mobile`
  Future<AppExitResponse> onExitAppRequest();
}
