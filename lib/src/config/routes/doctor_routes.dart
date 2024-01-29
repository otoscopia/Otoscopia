import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

class DoctorRoutes extends NamedDoctor {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.desktop || DeviceType.web:
        return _desktop(deviceType);
      default:
        return _mobile(deviceType);
    }
  }

  static Map<String, WidgetBuilder> _desktop(DeviceType deviceType) {
    return {
      NamedDoctor.dashboard: (context) => const AppNavigation(),
    };
  }

  static Map<String, WidgetBuilder> _mobile(DeviceType deviceType) {
    return {
      // TODO: [OT-20] Add routes for mobile
    };
  }
}
