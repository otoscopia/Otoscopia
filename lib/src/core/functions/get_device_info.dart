import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:otoscopia/src/core/core.dart';

DeviceType getDeviceType() {
  if (kIsWeb) {
    return DeviceType.web;
  } else if (Platform.isAndroid || Platform.isIOS) {
    return DeviceType.mobile;
  } else {
    return DeviceType.desktop;
  }
}
