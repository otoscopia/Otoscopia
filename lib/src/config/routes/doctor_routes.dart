import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

class DoctorRoutes extends NamedDoctor {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    return {
      NamedDoctor.dashboard: (context) => const AppNavigation(),
    };
  }
}
