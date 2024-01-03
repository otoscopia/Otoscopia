import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceType deviceType = getDeviceType();

  DependencyInjection().init(deviceType);

  runApp(
    ProviderScope(
      child: MyApp(deviceType),
    ),
  );
}
