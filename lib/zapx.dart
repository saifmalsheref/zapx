library;

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:sh_toast/show_toast.dart';
import 'package:zapx/Zap/widgets/check_banner.dart';
part 'package:zapx/Zap/extensions/zap_transition.dart';
part 'package:zapx/Zap/extensions/zap_validator.dart';
part 'package:zapx/Zap/extensions/global_navigation.dart';
part 'package:zapx/Zap/extensions/zapx_tools.dart';
part 'package:zapx/Zap/extensions/zap_widgets.dart';
part 'package:zapx/Zap/extensions/extensions.dart';
part 'package:zapx/Zap/widgets/material_app.dart';
part 'package:zapx/Zap/widgets/snack_bar.dart';

abstract class ZapInterface {}

class _ZapImpl extends ZapInterface {}

final Zap = _ZapImpl();

