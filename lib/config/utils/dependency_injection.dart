import 'package:appwrite/appwrite.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

import 'package:otoscopia/core/core.dart';

late Client client;
late Uuid uuid;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._internal();

  factory DependencyInjection() {
    return _singleton;
  }

  DependencyInjection._internal();

  Future<void> init(DeviceType deviceType) async {
    uuid = const Uuid();

    appwriteInit();
    switch (deviceType) {
      case DeviceType.mobile:
        mobileInit();
        break;
      case DeviceType.desktop:
        await desktopInit();
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

  Future<void> appwriteInit() async {
    client = Client();
    client.setEndpoint(Env.endpoint).setProject(Env.project);
  }
}
