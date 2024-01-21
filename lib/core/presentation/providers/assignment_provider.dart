import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class AssignmentNotifier extends StateNotifier<List<AssignmentEntity>> {
  AssignmentNotifier() : super([]);

  void setAssignments(List<AssignmentEntity> assignments) {
    state = assignments;
  }

  AssignmentEntity findByNurseAndSchool(String nurse, String school) {
    return state.firstWhere((assignment) {
      return assignment.nurse == nurse && assignment.school == school;
    });
  }
}

final assignmentProvider =
    StateNotifierProvider<AssignmentNotifier, List<AssignmentEntity>>(
  (ref) => AssignmentNotifier(),
);
