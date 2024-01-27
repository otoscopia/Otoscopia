import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class DashboardTabNotifier extends StateNotifier<List<Tab>> {
  static final List<Tab> tabs = [
    Tab(
      text: const Text(kHome),
      icon: const Icon(FluentIcons.home),
      closeIcon: null,
      semanticLabel: kHome,
      body: const CustomTable(),
    ),
  ];

  final StateNotifierProviderRef<DashboardTabNotifier, List<Tab>> ref;

  DashboardTabNotifier(this.ref) : super(tabs);

  void addTab(TableEntity table) {
    final int index = state
        .indexWhere((Tab tab) => (tab.text as Text).data == table.patient.name);

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: Text(table.patient.name),
        icon: const Icon(FluentIcons.home),
        semanticLabel: table.patient.name,
        body: Container(),
        onClosed: () {
          state = state..remove(tab);
        },
      );

      state = [...state, tab];
    } else {
      ref.read(dashboardIndexProvider.notifier).setIndex(index);
    }
  }

  void addPatient() {
    final int index = state.indexWhere(
      (Tab tab) => (tab.text as Text).data == kAddPatient,
    );

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: const Text(kAddPatient),
        icon: const Icon(FluentIcons.add_friend),
        semanticLabel: kAddPatient,
        body: const AddPatient(),
        onClosed: () {
          state = state..remove(tab);
          ref.read(addPatientTabProvider.notifier).resetTabs();
          ref.read(patientProvider.notifier).resetInformation();
        },
      );

      state = [...state, tab];
      ref.read(dashboardIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(dashboardIndexProvider.notifier).setIndex(index);
    }
  }
}

final dashboardTabProvider =
    StateNotifierProvider<DashboardTabNotifier, List<Tab>>(
  (ref) => DashboardTabNotifier(ref),
);

class DashboardIndexNotifier extends StateNotifier<int> {
  DashboardIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}

final dashboardIndexProvider =
    StateNotifierProvider<DashboardIndexNotifier, int>(
  (ref) => DashboardIndexNotifier(),
);
