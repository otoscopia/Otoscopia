import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

final List<NavigationPaneItem> navigation = [
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
