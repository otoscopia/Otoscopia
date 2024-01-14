import 'package:fluent_ui/fluent_ui.dart';
import 'package:ionicons/ionicons.dart';

import 'package:otoscopia/core/core.dart';

List<NavigationPaneItem> navigationItems(UserRole role) {
  return [
    PaneItem(
      icon: const Icon(FluentIcons.view_dashboard),
      title: const Text(kDashboard),
      body: Container(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.issue_tracking),
      title: const Text(kPatients),
      body: Container(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.e_discovery),
      title: const Text(kSchools),
      body: Container(),
    ),
    if (role == UserRole.doctor)
      PaneItem(
        icon: const Icon(Ionicons.git_network_outline),
        title: const Text(kNurse),
        body: Container(),
      ),
    if (role == UserRole.nurse)
      PaneItem(
        icon: const Icon(Ionicons.git_network_outline),
        title: const Text(kDoctor),
        body: Container(),
      ),
  ];
}
