import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/admin/admin.dart';

class AdminRoutes {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    return {
      "/": (context) => const AdminNavigation(),
    };
  }
}
