import 'dart:io' show Platform;
import 'package:flutter/material.dart';
part 'package:zapx/Zap/extensions/zap_transition.dart';
part 'package:zapx/Zap/extensions/zap_validator.dart';
part 'package:zapx/Zap/extensions/global_navigation.dart';
part 'package:zapx/Zap/extensions/Zapx.dart';

abstract class ZapInterface {}

class _ZapImpl extends ZapInterface {}

// ignore: non_constant_identifier_names
final Zap = _ZapImpl();
