import 'package:flutter/material.dart';

class ZapCheckedModeBanner extends StatelessWidget {
  const ZapCheckedModeBanner({super.key, this.message, this.child});
  final String? message;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    if (!isInDebugMode) {
      return child!;
    }
    return Banner(
      message: message ?? "Zap Debug",
      textDirection: TextDirection.ltr,
      location: BannerLocation.topEnd,
      child: child,
    );
  }
}

bool get isInDebugMode {
  // Parse the flag in flutter which indicates debug/profile/release mode
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}
