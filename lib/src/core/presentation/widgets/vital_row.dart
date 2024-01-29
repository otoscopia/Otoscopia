import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import 'package:otoscopia/src/core/core.dart';

class VitalRow extends ConsumerWidget {
  const VitalRow(this.icon, this.label, this.value, {super.key});
  final IoniconsData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Icon(icon),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(label, style: 3),
            CustomText(value, style: 6),
          ],
        ),
      ],
    );
  }
}
