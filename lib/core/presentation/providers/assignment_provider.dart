import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class AssignmentsNotifier extends StateNotifier<List<AssignmentEntity>> {
  AssignmentsNotifier() : super([]);

  void setAssignments(List<AssignmentEntity> assignments) {
    state = assignments;
  }

  AssignmentEntity findByNurseAndSchool(String nurse, String school) {
    return state.firstWhere((assignment) {
      return assignment.nurse == nurse && assignment.school == school;
    });
  }
}

final assignmentsProvider =
    StateNotifierProvider<AssignmentsNotifier, List<AssignmentEntity>>(
  (ref) => AssignmentsNotifier(),
);
