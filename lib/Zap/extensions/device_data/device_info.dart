// ignore_for_file: library_private_types_in_public_api, avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:zapx/Zap/zapx.dart';
part 'package:zapx/Zap/extensions/device_data/platforms/android.dart';
part 'package:zapx/Zap/extensions/device_data/platforms/linux.dart';

class DeviceInfo {
  Future<_Android> get android => _Android().initAndroid();
  Future<_Linux> get linux => _Linux().initLinux();
}

extension DeviceInfoExtension on ZapInterface {
  DeviceInfo get deviceInfo => DeviceInfo();
}
