import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

import 'package:otoscopia/src/core/core.dart';

late final Client client;
late final Realtime realtime;
late final Uuid uuid;
late final String applicationDirectory;
late final String documentDirectory;

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

    Directory applicationSupport = await getApplicationSupportDirectory();
    applicationDirectory = applicationSupport.path;

    Directory applicationDocuments = await getApplicationDocumentsDirectory();
    documentDirectory = applicationDocuments.path;
  }

  void mobileInit() {}

  void webInit() {}

  Future<void> appwriteInit() async {
    client = Client();
    client.setEndpoint(Env.endpoint).setProject(Env.project);
    realtime = Realtime(client);
  }
}
