import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class AssignmentsNotifier extends StateNotifier<List<AssignmentEntity>> {
  AssignmentsNotifier() : super([]);

  void setAssignments(List<AssignmentEntity> assignments) {
    state = assignments;
  }

  AssignmentEntity findByNurseAndSchool(String nurse, String school) {
    return state.firstWhere((assignment) {
      return assignment.nurse == nurse &&
          assignment.school == school &&
          assignment.isActive == true;
    });
  }

  AssignmentEntity findById(String id) {
    return state.firstWhere(
        (assignment) => assignment.id == id && assignment.isActive == true);
  }

  AssignmentEntity findBySchool(String school) {
    return state.firstWhere((assignment) =>
        assignment.school == school && assignment.isActive == true);
  }
}

final assignmentsProvider =
    StateNotifierProvider<AssignmentsNotifier, List<AssignmentEntity>>(
  (ref) => AssignmentsNotifier(),
);
