import 'package:appwrite/appwrite.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import 'package:otoscopia/src/core/core.dart';

import 'desktop_dependency.dart';

late final Client client;
late final Realtime realtime;
late final Uuid uuid;
late final String applicationDirectory;
late final String documentDirectory;
late final FlutterSecureStorage secureStorage;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._internal();

  factory DependencyInjection() {
    return _singleton;
  }

  DependencyInjection._internal();

  Future<void> init(DeviceType deviceType) async {
    uuid = const Uuid();

    secureStorage = const FlutterSecureStorage();

    await appwriteInit();

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

  void mobileInit() {}

  void webInit() {}

  Future<void> appwriteInit() async {
    client = Client();
    client.setEndpoint(Env.endpoint).setProject(Env.project);
    realtime = Realtime(client);
  }
}
