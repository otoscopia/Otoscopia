import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as icons;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/profile/profile.dart';
import 'package:otoscopia/src/features/settings/settings.dart';

class NavigationEntity {
  final BuildContext _context;
  final WidgetRef _ref;

  NavigationEntity(this._context, this._ref);

  String get image => _ref.watch(userProvider).image!;

  List<NavigationPaneItem> get footer => [
        PaneItemSeparator(),
        PaneItemAction(
          icon: const Icon(icons.FluentIcons.megaphone_loud_20_regular),
          title: const Text("Whats New"),
          onTap: () async => await whatsNew(_context),
        ),
        PaneItem(
          icon: CircularImage(image),
          title: const Text("User Profile"),
          body: const Profile(),
        ),
        PaneItem(
          icon: const Icon(icons.FluentIcons.settings_20_regular),
          title: const Text(kSettings),
          body: const Settings(),
        ),
        PaneItemSeparator(),
      ];

  List<NavigationPaneItem> get items => [
        PaneItem(
          icon: const Icon(FluentIcons.view_dashboard),
          title: const Text(kDashboard),
          body: const Dashboard(),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.issue_tracking),
          title: const Text(kPatients),
          body: const Patients(),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.e_discovery),
          title: const Text(kSchools),
          body: const Schools(),
        ),
      ];
}
