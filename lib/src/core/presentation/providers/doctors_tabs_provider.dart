import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class DoctorsTabNotifier extends StateNotifier<List<Tab>> {
  static final List<Tab> _tabs = [
    Tab(
      text: const Text(kHome),
      icon: const Icon(FluentIcons.home),
      closeIcon: null,
      semanticLabel: kHome,
      body: const DoctorsTable(),
    ),
  ];

  final StateNotifierProviderRef<DoctorsTabNotifier, List<Tab>> ref;

  DoctorsTabNotifier(this.ref) : super(_tabs);

  void addTab(UsersEntity school) {
    final int index =
        state.indexWhere((Tab tab) => (tab.text as Text).data == school.name);

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: Text(school.name),
        icon: const Icon(FluentIcons.home),
        semanticLabel: school.name,
        body: DoctorsInfo(school),
        onClosed: () {
          state = state..remove(tab);
        },
      );

      state = [...state, tab];
      ref.read(doctorsIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(doctorsIndexProvider.notifier).setIndex(index);
    }
  }
}

final doctorsTabProvider = StateNotifierProvider<DoctorsTabNotifier, List<Tab>>(
  (ref) => DoctorsTabNotifier(ref),
);

class DoctorsIndexNotifier extends StateNotifier<int> {
  DoctorsIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}

final doctorsIndexProvider =
    StateNotifierProvider<DoctorsIndexNotifier, int>((ref) {
  return DoctorsIndexNotifier();
});
