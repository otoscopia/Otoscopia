import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'package:otoscopia/core/core.dart';

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._internal();

  factory DependencyInjection() {
    return _singleton;
  }

  DependencyInjection._internal();

  void init(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.mobile:
        mobileInit();
        break;
      case DeviceType.desktop:
        desktopInit();
        break;
      case DeviceType.web:
        webInit();
        break;
    }
  }

  Future<void> desktopInit() async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1000, 700),
      minimumSize: Size(1000, 700),
      title: kAppName,
      center: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  void mobileInit() {}

  void webInit() {}
}
