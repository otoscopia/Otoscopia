import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:otoscopia/application.dart';
import 'package:otoscopia/src/app.dart';
import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

Future<void> main() async {
  const sentryRelease = '$kPackageName@${ApplicationConfig.currentVersion}';

  WidgetsFlutterBinding.ensureInitialized();

  DeviceType deviceType = getDeviceType();

  await DependencyInjection().init(deviceType);

  await SentryFlutter.init((options) {
    options.dsn = Env.sentryApi;
    options.release = sentryRelease;
  }, appRunner: () {
    return runApp(
      DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: ProviderScope(
          child: MyApp(deviceType),
        ),
      ),
    );
  });
}
