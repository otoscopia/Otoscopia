import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

class NurseRoutes extends NamedNurse {
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
      NamedNurse.dashboard: (context) => const AppNavigation(),
    };
  }

  static Map<String, WidgetBuilder> _mobile(DeviceType deviceType) {
    return {
      // TODO: [OT-22] Add routes for mobile
    };
  }
}
