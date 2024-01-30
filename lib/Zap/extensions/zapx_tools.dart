part of 'package:zapx/zapx.dart';

/// Extension providing utility properties for ZapInterface.
extension Tools on ZapInterface {
  /// A key for accessing the navigator state.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Returns the current BuildContext using the navigator key.
  BuildContext get context => navigatorKey.currentState!.overlay!.context;

  /// Indicates whether the app is currently in dark mode.
  bool get isDarkMode => Theme.of(context).brightness == Brightness.dark;

  /// Returns the height of the device screen.
  double get height => MediaQuery.of(context).size.height;

  /// Returns the width of the device screen.
  double get width => MediaQuery.of(context).size.width;

  /// Returns the height of the device's status bar.
  double get statusBarHeight => MediaQuery.of(context).padding.top;

  /// Returns the height of the device's bottom navigation bar.
  double get bottomBarHeight => MediaQuery.of(context).padding.bottom;

  /// Returns the height of the device's top app bar.
  double get topBarHeight =>
      MediaQuery.of(context).padding.top + kToolbarHeight;

  /// Returns the height of the device's safe area.
  double get safeAreaHeight => height - statusBarHeight - bottomBarHeight;

  /// Returns the width of the device's safe area.
  double get safeAreaWidth => width - statusBarHeight - bottomBarHeight;

  /// Returns the current locale of the app.
  Locale? get locale => Localizations.localeOf(context);

  /// Returns the system locale of the device.
  Locale get systemLocale => View.of(context).platformDispatcher.locale;

  Orientation get deviceOrientation => MediaQuery.of(context).orientation;

  /// Returns the current platform of the device (iOS, Android, etc.).
  TargetPlatform get platform => Theme.of(context).platform;

  /// Returns the device pixel density.
  double get pixelDensity => MediaQuery.of(context).devicePixelRatio;

  /// Returns the text scale factor of the device.
  double get textScaleFactor => MediaQuery.of(context).textScaleFactor;

  /// Returns the system insets of the device.
  EdgeInsets get systemInsets => MediaQuery.of(context).viewInsets;

  /// Returns the current ThemeData of the app.
  ThemeData get currentTheme => Theme.of(context);

  /// Returns the version of the operating system on the device.
  String get platformVersion => Platform.operatingSystemVersion;

  /// Returns whether the device has accessibility features enabled.
  bool get isAccessibilityEnabled =>
      MediaQuery.of(context).accessibleNavigation;
}
