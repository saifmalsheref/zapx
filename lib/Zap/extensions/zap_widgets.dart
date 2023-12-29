part of 'package:zapx/Zap/zapx.dart';

extension ZapWidgets on ZapInterface {
  void showSnackBar(SnackBar snackBar, {BuildContext? context}) =>
      ScaffoldMessenger.of(context ?? Zap.context).showSnackBar(snackBar);
}
