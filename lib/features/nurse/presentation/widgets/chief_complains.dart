import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class ChiefComplains extends ConsumerStatefulWidget {
  const ChiefComplains(
    this._chiefComplains,
    this._chiefComplainsRemarksController, {
    super.key,
  });

  final List<bool> _chiefComplains;
  final TextEditingController _chiefComplainsRemarksController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChiefComplainsState();
}

class _ChiefComplainsState extends ConsumerState<ChiefComplains> {
  List<bool> chiefComplains = List.generate(complains.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLabel(
          label: kChiefComplains,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(complains.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Checkbox(
                  content: Text(complains[index]),
                  checked: chiefComplains[index],
                  onChanged: (value) => setState(() {
                    chiefComplains[index] = !chiefComplains[index];
                  }),
                ),
              );
            }),
          ),
        ),
        if (chiefComplains[4]) const Gap(16),
        if (chiefComplains[4])
          TextFormInput(
            kChiefComplainsRemarks,
            widget._chiefComplainsRemarksController,
            maxLines: 5,
          ),
      ],
    );
  }

  @override
  void initState() {
    chiefComplains = widget._chiefComplains;
    super.initState();
  }
}
