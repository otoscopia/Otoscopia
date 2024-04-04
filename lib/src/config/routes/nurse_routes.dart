import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

class NurseRoutes extends NamedNurse {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    return {
      NamedNurse.dashboard: (context) => const AppNavigation(),
    };
  }
}
