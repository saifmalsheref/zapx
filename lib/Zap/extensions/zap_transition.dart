// ignore_for_file: file_names

part of 'package:zapx/zapx.dart';

// Consider adding comments to explain the purpose of the enum.
enum Transition {
  fade,
  fadeIn,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  rightToLeftWithFade,
  leftToRightWithFade,
  zoom,
  topLevel,
  cupertino,
  cupertinoDialog,
  size,
  circularReveal,
  native,
}

// Consider renaming this function to make its purpose clearer.
PageRoute _buildPageRoute(
    dynamic page, RouteSettings? settings, Transition transition,
    {bool allowSnapshotting = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool fullscreenDialog = false,
    bool maintainState = true,
    bool opaque = true,
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Duration transitionDuration = const Duration(milliseconds: 300)}) {
      Widget transitionsBuilder (BuildContext context,Animation<double> animation,Animation<double> secondaryAnimation,Widget child){
   switch (transition) {
        case Transition.fade:
          return _buildFadeTransition(animation, child);
        case Transition.fadeIn:
          return _buildFadeInTransition(animation, child);
        case Transition.rightToLeft:
          return _buildRightToLeftTransition(animation, child);
        case Transition.leftToRight:
          return _buildLeftToRightTransition(animation, child);
        case Transition.upToDown:
          return _buildUpToDownTransition(animation, child);
        case Transition.downToUp:
          return _buildDownToUpTransition(animation, child);
        case Transition.rightToLeftWithFade:
          return _buildRightToLeftWithFadeTransition(animation, child);
        case Transition.leftToRightWithFade:
          return _buildLeftToRightWithFadeTransition(animation, child);
        case Transition.zoom:
          return _buildZoomTransition(animation, child);
        case Transition.topLevel:
          return _buildTopLevelTransition(animation, child);
        default:
          return child;
      }
       } 
    
  // Consider adding comments to explain the purpose and parameters of this function.
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>page is WidgetBuilder? page(context) : page,
    transitionsBuilder:transitionsBuilder,
    allowSnapshotting: allowSnapshotting,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    opaque: opaque,
    reverseTransitionDuration: reverseTransitionDuration,
    transitionDuration: transitionDuration,
    settings: settings,
  );
}

// Consider adding comments to explain the purpose of each animation function.

FadeTransition _buildFadeTransition(Animation<double> animation, Widget child) {
  var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
  return FadeTransition(opacity: fadeAnimation, child: child);
}

FadeTransition _buildFadeInTransition(
    Animation<double> animation, Widget child) {
  var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
  return FadeTransition(opacity: fadeAnimation, child: child);
}

SlideTransition _buildRightToLeftTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

SlideTransition _buildLeftToRightTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(-1.0, 0.0);
  const end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

SlideTransition _buildUpToDownTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(0.0, -1.0);
  const end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

SlideTransition _buildDownToUpTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

SlideTransition _buildRightToLeftWithFadeTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

SlideTransition _buildLeftToRightWithFadeTransition(
    Animation<double> animation, Widget child) {
  const begin = Offset(-1.0, 0.0);
  const end = Offset.zero;
  var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}

ScaleTransition _buildZoomTransition(
    Animation<double> animation, Widget child) {
  var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
  return ScaleTransition(scale: scaleAnimation, child: child);
}

FadeTransition _buildTopLevelTransition(
    Animation<double> animation, Widget child) {
  var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
  return FadeTransition(opacity: fadeAnimation, child: child);
}
