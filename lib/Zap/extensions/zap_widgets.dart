part of 'package:zapx/zapx.dart';

extension ZapWidgets on ZapInterface {
  void showSnackBar(SnackBar snackBar, {BuildContext? context}) =>
      ScaffoldMessenger.of(context ?? Zap.context).showSnackBar(snackBar);
}
