import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class SchoolsNotifier extends StateNotifier<List<SchoolEntity>> {
  SchoolsNotifier() : super([]);

  void setSchools(List<SchoolEntity> schools) => state = schools;
}

final schoolsProvider =
    StateNotifierProvider<SchoolsNotifier, List<SchoolEntity>>(
  (ref) => SchoolsNotifier(),
);
