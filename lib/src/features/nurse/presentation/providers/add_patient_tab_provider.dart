import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/features/nurse/nurse.dart';

class AddPatientTabNotifier extends StateNotifier<List<Tab>> {
  static final tabs = [
    Tab(
      text: const Text("Patient Information"),
      body: const AddPatientInformation(),
    ),
  ];

  final StateNotifierProviderRef<AddPatientTabNotifier, List<Tab>> ref;

  AddPatientTabNotifier(this.ref) : super(tabs);

  void addLeftCamera() {
    final int index = state.indexWhere(
      (Tab tab) => (tab.text as Text).data == "Left Camera",
    );

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: const Text("Left Camera"),
        body: const LeftCamera(),
      );

      state = [...state, tab];
      ref.read(addPatientIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(addPatientIndexProvider.notifier).setIndex(index);
    }
  }

  void addRightCamera() {
    final int index = state.indexWhere(
      (Tab tab) => (tab.text as Text).data == "Right Camera",
    );

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: const Text("Right Camera"),
        body: const RightCamera(),
      );

      state = [...state, tab];
      ref.read(addPatientIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(addPatientIndexProvider.notifier).setIndex(index);
    }
  }

  void addScreeningInformation() {
    final int index = state.indexWhere(
      (Tab tab) => (tab.text as Text).data == "Screening Information",
    );

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: const Text("Screening Information"),
        body: const ScreeningInformation(),
      );

      state = [...state, tab];
      ref.read(addPatientIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(addPatientIndexProvider.notifier).setIndex(index);
    }
  }

  void addReview() {
    final int index = state.indexWhere(
      (Tab tab) => (tab.text as Text).data == "Review",
    );

    if (!(index != -1)) {
      late final Tab tab;
      tab = Tab(
        text: const Text("Review"),
        body: Container(),
      );

      state = [...state, tab];
      ref.read(addPatientIndexProvider.notifier).setIndex(state.length - 1);
    } else {
      ref.read(addPatientIndexProvider.notifier).setIndex(index);
    }
  }

  void resetTabs() {
    state = tabs;
    ref.read(addPatientIndexProvider.notifier).setIndex(0);
  }
}

final addPatientTabProvider =
    StateNotifierProvider<AddPatientTabNotifier, List<Tab>>(
  (ref) => AddPatientTabNotifier(ref),
);

class AddPatientIndexNotifier extends StateNotifier<int> {
  AddPatientIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}

final addPatientIndexProvider =
    StateNotifierProvider<AddPatientIndexNotifier, int>(
  (ref) => AddPatientIndexNotifier(),
);
