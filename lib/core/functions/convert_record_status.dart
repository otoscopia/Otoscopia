import 'package:otoscopia/core/core.dart';

String convertRecordStatus(RecordStatus status) {
  switch (status) {
    case RecordStatus.pending:
      return kPending;
    case RecordStatus.followUp:
      return kFollowUp;
    case RecordStatus.medicalAttention:
      return kMedicalAttention;
    default:
      return kResolved;
  }
}