part of 'package:zapx/Zap/zapx.dart';

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
  void to(
    dynamic page, {
    RouteSettings? settings,
    Transition transition = Transition.native,
    bool allowSnapshotting = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
  }) =>
      Navigator.push(
        Zap.context,
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
  void toNamed(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.pushNamed(
        Zap.context,
        routeName,
        arguments: arguments,
      );

  /// Pop the current route from the Navigator stack.
  void back() => Navigator.pop(Zap.context);

  /// Replace the current page with a new one.
  ///
  /// This is useful for scenarios like navigating from a login page to a home page
  /// and wanting to replace the login page in the stack with the home page.
  void off(
    dynamic newPage, {
    RouteSettings? settings,
    Transition transition = Transition.native,
    bool allowSnapshotting = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
  }) =>
      Navigator.of(Zap.context).pushReplacement(
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
  void offAll(
    dynamic newPage, {
    RouteSettings? settings,
    Transition transition = Transition.native,
    bool allowSnapshotting = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
  }) =>
      Navigator.pushAndRemoveUntil(
          context,
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
  void offNamed(String routeName, {Object? arguments, Object? result}) =>
      Navigator.pushReplacementNamed(context, routeName,
          arguments: arguments, result: result);

  /// Replace the entire Navigator stack with a new named route.
  ///
  /// This method removes all existing routes from the Navigator stack and pushes the new named route.
  void offAllNamed(String routeName, {Object? arguments}) =>
      Navigator.of(Zap.context).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
}
