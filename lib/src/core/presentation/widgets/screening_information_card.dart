import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class ScreeningInformationCard extends ConsumerWidget {
  const ScreeningInformationCard(this._screening, {super.key});
  final ScreeningEntity _screening;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyOfIllness = _screening.historyOfIllness;
    final remarks = _screening.remarks;
    final chiefComplain = _screening.chiefComplaintString;
    final chiefComplainRemarks = _screening.chiefComplaintRemarks;
    final similarCondition = _screening.similarCondition;
    final allergy = _screening.allergy;
    final allergyRemarks = _screening.allergyRemarks;
    final undergoneSurgery = _screening.undergoneSurgery;
    final undergoneSurgeryRemarks = _screening.undergoneSurgeryRemarks;
    final medication = _screening.medication;
    final medicationRemarks = _screening.medicationRemarks;

    return CardOpacity(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          const CustomText(kScreeningInformation, style: 1),
          CustomText("$kHistoryOfIllness: $historyOfIllness", style: 3),
          CustomText("$kRemarks: $remarks", style: 3),
          CustomText("$kChiefComplains: $chiefComplain", style: 3),
          if (_screening.chiefComplaint[4])
            CustomText(
              "$kChiefComplainsRemarks: $chiefComplainRemarks",
              style: 3,
            ),
          CustomText(
            "$kSimilarCondition: ${similarCondition ? yesNo[0] : yesNo[1]}",
            style: 3,
          ),
          CustomText(
            "$kAllergyRreview: ${allergy ? allergyRemarks : kNone}",
            style: 3,
          ),
          CustomText(
            "$kUndergoneSurgeryReview: ${undergoneSurgery ? undergoneSurgeryRemarks : kNone}",
            style: 3,
          ),
          CustomText(
            "$kMedicationReview: ${medication ? medicationRemarks : kNone}",
            style: 3,
          ),
        ],
      ),
    );
  }
}
