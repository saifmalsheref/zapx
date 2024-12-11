part of 'package:zapx/zapx.dart';

class XMaterialApp extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, Widget Function(BuildContext)>? routes;
  final String? initialRoute;
  final String? checkedBannerMessage;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode themeMode;
  final Color? color;
  final Map<String, Map<String, String>>? translationsKeys;
  final TextDirection? textDirection;
  final Locale? locale;
  final Locale? fallbackLocale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ScrollBehavior? scrollBehavior;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final bool debugShowMaterialGrid;
  final bool? opaqueRoute;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final bool? enableLog;
  final bool? popGesture;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final bool useInheritedMediaQuery;
  final bool Function(NavigationNotification)? onNavigationNotification;
  final bool isRouter;
  final RouterConfig<Object>? routerConfig;
  final String? restorationScopeId;
  final Curve themeAnimationCurve;
  final Duration themeAnimationDuration;
  final AnimationStyle? themeAnimationStyle;
  static XMaterialApp of(BuildContext? context) {
    context ??= Zap.context;
    final ancestor = context.findAncestorWidgetOfExactType<XMaterialApp>();
    assert(ancestor != null, 'No XMaterialApp found in the widget tree');
    return ancestor!;
  }

  const XMaterialApp({
    Key? key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.themeAnimationStyle,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.checkedBannerMessage,
    this.restorationScopeId,
    this.themeAnimationCurve = Curves.linear,
    this.home,
    Map<String, Widget Function(BuildContext)> this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.useInheritedMediaQuery = false,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.textDirection,
    this.title = '',
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.fallbackLocale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.translationsKeys,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.opaqueRoute,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    this.enableLog,
  })  : routeInformationProvider = null,
        isRouter = false,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null,
        super(key: key);

  const XMaterialApp.router({
    Key? key,
    this.routeInformationProvider,
    this.scaffoldMessengerKey,
    this.routeInformationParser,
    this.checkedBannerMessage,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.onNavigationNotification,
    this.darkTheme,
    this.useInheritedMediaQuery = false,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.actions,
    this.translationsKeys,
    this.textDirection,
    this.fallbackLocale,
    this.opaqueRoute,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.enableLog,
    this.routerConfig,
    this.restorationScopeId,
    this.themeAnimationStyle,
    this.themeAnimationCurve = Curves.linear,
    this.themeAnimationDuration = kThemeAnimationDuration,
  })  : navigatorKey = null,
        onGenerateRoute = null,
        isRouter = true,
        navigatorObservers = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (navigatorKey != null) {
      Tools.navigatorKey = navigatorKey!;
    }
    if (isRouter) {
      return MaterialApp.router(
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        routerDelegate: routerDelegate,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: routerConfig,
        themeAnimationDuration: themeAnimationDuration,
        themeAnimationStyle: themeAnimationStyle,
        backButtonDispatcher: backButtonDispatcher,
        themeAnimationCurve: themeAnimationCurve,
        restorationScopeId: restorationScopeId,
        onNavigationNotification: onNavigationNotification,
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
        color: color,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        shortcuts: shortcuts,
        scrollBehavior: scrollBehavior,
        highContrastTheme: highContrastTheme,
        highContrastDarkTheme: highContrastDarkTheme,
        actions: actions,
        debugShowMaterialGrid: debugShowMaterialGrid,
      );
    }
    return MaterialApp(
      themeAnimationDuration: themeAnimationDuration,
      themeAnimationStyle: themeAnimationStyle,
      themeAnimationCurve: themeAnimationCurve,
      navigatorKey: navigatorKey ?? Tools.navigatorKey,
      restorationScopeId: restorationScopeId,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes ?? {},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers ?? [],
      onNavigationNotification: onNavigationNotification,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      scrollBehavior: scrollBehavior,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      actions: actions,
      debugShowMaterialGrid: debugShowMaterialGrid,
    );
  }
}
