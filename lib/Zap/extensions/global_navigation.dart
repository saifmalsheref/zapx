part of 'package:zapx/zapx.dart';

/// Extension on `ZapInterface` providing convenient navigation methods using the Flutter Navigator.
///
/// The [ZapNavigation] extension includes methods for navigating to pages, pushing and replacing routes,
/// popping routes, and managing route transitions.
extension ZapNavigation on ZapInterface {
  /// Navigate to a new page with various configurable options.
  ///
  /// Parameters:
  /// - `page`: The page to navigate to.
  /// - `settings`: Optional settings for the route.
  /// - `transition`: The transition animation type (default is [Transition.native]).
  /// - `allowSnapshotting`: Whether to allow the page to be snapshot for restoration.
  /// - `barrierColor`: Color of the barrier on transition.
  /// - `barrierDismissible`: Whether the barrier should be dismissible.
  /// - `barrierLabel`: Label for the barrier.
  /// - `maintainState`: Whether to maintain the state of the previous page.
  /// - `fullscreenDialog`: Whether the page should be presented as a fullscreen dialog.
  /// - `transitionDuration`: Duration of the transition animation.
  /// - `reverseTransitionDuration`: Duration of the reverse transition animation.
  /// - `opaque`: Whether the page is opaque during transitions.
  Future to(dynamic page,
          {RouteSettings? settings,
          Transition transition = Transition.native,
          bool allowSnapshotting = true,
          Color? barrierColor,
          bool barrierDismissible = true,
          String? barrierLabel,
          bool maintainState = true,
          bool fullscreenDialog = false,
          Duration transitionDuration = const Duration(milliseconds: 300),
          Duration reverseTransitionDuration =
              const Duration(milliseconds: 300),
          bool opaque = true,
          BuildContext? context}) async =>
      await Navigator.push(
        context ?? Zap.context,
        _buildPageRoute(
          page,
          settings,
          transition,
          allowSnapshotting: allowSnapshotting,
          barrierColor: barrierColor,
          barrierDismissible: barrierDismissible,
          barrierLabel: barrierLabel,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          opaque: opaque,
        ),
      );

  /// Navigate to a named route with optional arguments.
  Future toNamed(String routeName,
          {Object? arguments, BuildContext? context}) async =>
      await Navigator.pushNamed(
        context ?? Zap.context,
        routeName,
        arguments: arguments,
      );

  /// Pop the current route from the Navigator stack.
  void back({BuildContext? context}) => Navigator.pop(context ?? Zap.context);

  /// Replace the current page with a new one.
  ///
  /// This is useful for scenarios like navigating from a login page to a home page
  /// and wanting to replace the login page in the stack with the home page.
  Future off(dynamic newPage,
          {RouteSettings? settings,
          Transition transition = Transition.native,
          bool allowSnapshotting = true,
          Color? barrierColor,
          bool barrierDismissible = true,
          String? barrierLabel,
          bool maintainState = true,
          bool fullscreenDialog = false,
          Duration transitionDuration = const Duration(milliseconds: 300),
          Duration reverseTransitionDuration =
              const Duration(milliseconds: 300),
          bool opaque = true,
          BuildContext? context}) async =>
      await Navigator.of(context ?? Zap.context).pushReplacement(
        _buildPageRoute(
          newPage,
          settings,
          transition,
          allowSnapshotting: allowSnapshotting,
          barrierColor: barrierColor,
          barrierDismissible: barrierDismissible,
          barrierLabel: barrierLabel,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          opaque: opaque,
        ),
      );

  /// Replace the entire Navigator stack with a new page.
  ///
  /// This method removes all existing routes from the Navigator stack and pushes the new page.
  Future offAll(dynamic newPage,
          {RouteSettings? settings,
          Transition transition = Transition.native,
          bool allowSnapshotting = true,
          Color? barrierColor,
          bool barrierDismissible = true,
          String? barrierLabel,
          bool maintainState = true,
          bool fullscreenDialog = false,
          Duration transitionDuration = const Duration(milliseconds: 300),
          Duration reverseTransitionDuration =
              const Duration(milliseconds: 300),
          bool opaque = true,
          BuildContext? context}) async =>
      await Navigator.pushAndRemoveUntil(
          context ?? Zap.context,
          _buildPageRoute(
            newPage,
            settings,
            transition,
            allowSnapshotting: allowSnapshotting,
            barrierColor: barrierColor,
            barrierDismissible: barrierDismissible,
            barrierLabel: barrierLabel,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            opaque: opaque,
          ),
          (route) => false);

  /// Replace the current named route with a new one.
  ///
  /// This is similar to [off], but for named routes.
  Future offNamed(String routeName,
          {Object? arguments, Object? result, BuildContext? context}) async =>
      await Navigator.pushReplacementNamed(context ?? Zap.context, routeName,
          arguments: arguments, result: result);

  /// Replace the entire Navigator stack with a new named route.
  ///
  /// This method removes all existing routes from the Navigator stack and pushes the new named route.
  Future offAllNamed(String routeName,
          {Object? arguments, BuildContext? context}) async =>
      await Navigator.of(context ?? Zap.context).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );

  void reload(Widget pageName) {
    Tools.navigatorKey.currentState?.pop();
    Tools.navigatorKey.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pageName,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: child),
      ),
    );
  }
}
