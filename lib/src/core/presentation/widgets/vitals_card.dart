import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

import 'package:otoscopia/src/core/core.dart';

class VitalsCard extends ConsumerWidget {
  const VitalsCard(this._screening, {super.key, this.isReview = false});
  final ScreeningEntity _screening;
  final bool isReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vitalSigns = _screening.statusIcon;
    final vitalSignsColor = _screening.statusColor;
    final uploadedAt = DateFormat.yMMMMd().format(_screening.createdAt);
    final temperature = _screening.temperature.toStringAsFixed(1);
    final weight = _screening.weight.toStringAsFixed(1);
    final height = _screening.height.toStringAsFixed(1);
    final updated = _screening.status != RecordStatus.pending;
    final updatedAt = DateFormat.yMMMMd().format(_screening.updatedAt);

    return CardOpacity(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(vitalSigns, color: vitalSignsColor, size: 32),
              const Gap(8),
              CustomText(_screening.statusString, style: 2),
            ],
          ),
          const Gap(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(4),
              if (updated)
                VitalRow(Ionicons.cloud_upload, kModifiedAt, uploadedAt)
              else if (isReview || !updated)
                VitalRow(Ionicons.cloud_upload, kUploadedAt, updatedAt),
              const Gap(16),
              VitalRow(Ionicons.thermometer, kTemperature, temperature),
              const Gap(16),
              VitalRow(Ionicons.thermometer, kTemperature, temperature),
              const Gap(16),
              VitalRow(Ionicons.barbell, kWeight, weight),
              const Gap(16),
              VitalRow(Ionicons.body, kHeight, height),
            ],
          ),
        ],
      ),
    );
  }
}
