import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class AddPatientInformation extends ConsumerStatefulWidget {
  const AddPatientInformation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPatientInformationState();
}

class _AddPatientInformationState extends ConsumerState<AddPatientInformation> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  int? gender;
  DateTime? birthDate;
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianPhoneNumberController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<SchoolEntity> schools = ref.read(schoolsProvider);
    final List<AutoSuggestBoxItem<SchoolEntity>> items = schools
        .map((item) => AutoSuggestBoxItem(value: item, label: item.name))
        .toList();

    return Card(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextInputForm(kFullName, controller: nameController),
            const Gap(16),
            SizedBox(
              width: 295,
              child: InfoLabel(
                label: kGender,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) {
                      String genders = Gender.values[index]
                          .toString()
                          .split(".")[1]
                          .uppercaseFirst();

                      return RadioButton(
                        content: Text(genders),
                        checked: gender == index,
                        onChanged: (value) {
                          if (value) {
                            setState(() => gender = index);
                          }
                        },
                      );
                    })),
              ),
            ),
            const Gap(16),
            InfoLabel(
              label: kBirthDate,
              child: DatePicker(
                selected: birthDate,
                endDate: DateTime.now(),
                onChanged: (value) {
                  setState(() => birthDate = value);
                },
              ),
            ),
            const Gap(16),
            TextInputForm(kGuardianName, controller: guardianNameController),
            const Gap(16),
            TextInputForm(
              kGuardianPhoneNumber,
              controller: guardianPhoneNumberController,
              phoneNumber: true,
            ),
            const Gap(16),
            SizedBox(
              width: 295,
              child: InfoLabel(
                label: kSchool,
                child: AutoSuggestBox(
                  controller: schoolController,
                  items: items,
                  onSelected: (value) =>
                      setState(() => schoolController.text = value.value!.id),
                ),
              ),
            ),
            const Gap(16),
            TextInputForm(
              kIdNumber,
              controller: idNumberController,
              idNumber: true,
            ),
            const Gap(16),
            AddPatientInformationBtn(
              name: nameController.text,
              gender: gender,
              birthDate: birthDate,
              school: guardianNameController.text,
              idNumber: guardianPhoneNumberController.text,
              guardiansName: schoolController.text,
              guardiansPhone: idNumberController.text,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    PatientEntity patient = ref.read(addPatientInformationProvider);
    nameController.text = patient.name;
    gender = patient.gender.index;
    birthDate = patient.birthDate;
    guardianNameController.text = patient.guardian;
    guardianPhoneNumberController.text = patient.guardianPhone;
    schoolController.text = patient.school;
    idNumberController.text = patient.idNumber;
    super.initState();
  }
}
