import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';

class MyApp extends ConsumerWidget {
  const MyApp(this.deviceType, {super.key});
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, WidgetBuilder> routes = createRoutes(false, deviceType, null);
    return FluentApp(
      routes: routes,
      title: kAppName,
      initialRoute: kInitialRoute,
      themeMode: ThemeMode.system,
      theme: LightTheme.themeData,
      darkTheme: DarkTheme.themeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => responsiveBuilder(child!),
    );
  }
}
