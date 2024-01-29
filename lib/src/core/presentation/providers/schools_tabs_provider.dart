import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class SchoolsTabNotifier extends StateNotifier<List<Tab>> {
  static final List<Tab> _tabs = [
    Tab(
      text: const Text(kHome),
      icon: const Icon(FluentIcons.home),
      closeIcon: null,
      semanticLabel: kHome,
      body: const SchoolsTable(),
    ),
  ];

  final StateNotifierProviderRef<SchoolsTabNotifier, List<Tab>> ref;

  SchoolsTabNotifier(this.ref) : super(_tabs);

  void addTab(SchoolEntity school) {
    final int index =
        state.indexWhere((Tab tab) => (tab.text as Text).data == school.name);

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: Text(school.name),
        icon: const Icon(FluentIcons.home),
        semanticLabel: school.name,
        body: SchoolsInfo(school),
        onClosed: () {
          state = state..remove(tab);
        },
      );

      state = [...state, tab];
      ref.read(schoolsIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(schoolsIndexProvider.notifier).setIndex(index);
    }
  }
}

final schoolsTabProvider = StateNotifierProvider<SchoolsTabNotifier, List<Tab>>(
  (ref) => SchoolsTabNotifier(ref),
);

class SchoolsIndexNotifier extends StateNotifier<int> {
  SchoolsIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}

final schoolsIndexProvider =
    StateNotifierProvider<SchoolsIndexNotifier, int>((ref) {
  return SchoolsIndexNotifier();
});
