import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class SchoolsNotifier extends StateNotifier<List<SchoolEntity>> {
  SchoolsNotifier() : super([]);

  void setSchools(List<SchoolEntity> schools) {
    schools.sort((a, b) => a.name.compareTo(b.name));
    state = schools;
  }

  SchoolEntity findByName(String name) {
    final SchoolEntity school = state.firstWhere((school) => school.name == name);
    return school;
  }

  SchoolEntity findById(String id) {
    final SchoolEntity school = state.firstWhere((school) => school.id == id);
    return school;
  }
}

final schoolsProvider =
    StateNotifierProvider<SchoolsNotifier, List<SchoolEntity>>(
  (ref) => SchoolsNotifier(),
);
