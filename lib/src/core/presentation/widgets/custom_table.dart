import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class CustomTable extends ConsumerWidget {
  const CustomTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserRole role = ref.read(userProvider).role;
    bool nurse = role == UserRole.nurse;
    bool doctor = role == UserRole.doctor;

    final data = ref.watch(tableProvider);

    m3.DataTableSource source = TableSource(ref, data);

    return Card(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          PaginatedDataTable2(
            dividerThickness: 0,
            showCheckboxColumn: false,
            minWidth: 1200,
            empty: const Center(child: Text(kNoDataAvailable)),
            headingRowColor:
                const m3.MaterialStatePropertyAll(Colors.transparent),
            sortArrowAlwaysVisible: true,
            rowsPerPage: 20,
            columns: [
              const DataColumn2(label: Text(kName)),
              const DataColumn2(label: Text(kAgeAndGender), size: ColumnSize.S),
              const DataColumn2(label: Text(kStatus), fixedWidth: 175),
              const DataColumn2(label: Text(kSchool)),
              if (nurse) const DataColumn2(label: Text(kDoctor)),
              if (doctor) const DataColumn2(label: Text(kNurse)),
            ],
            source: source,
          ),
          if (nurse)
            Positioned(
              bottom: 20,
              right: 240,
              child: HyperlinkButton(
                child: const Text(kAddPatient),
                onPressed: () {
                  ref.read(dashboardTabProvider.notifier).addPatient();
                },
              ),
            ),
        ],
      ),
    );
  }
}

class TableSource extends m3.DataTableSource {
  final WidgetRef ref;
  final List<TableEntity> _data;

  TableSource(this.ref, this._data);

  @override
  m3.DataRow? getRow(int index) {
    final role = ref.read(userProvider).role == UserRole.nurse;
    final table = _data[index];
    final patient = table.patient;
    
    final school = ref.read(schoolsProvider.notifier).findById(patient.school);
    final assignment = ref.read(assignmentsProvider.notifier).findBySchool(school.id);
    final nurse = ref.read(nursesProvider.notifier).findById(assignment.nurse);
    final doctor = ref.read(doctorsProvider.notifier).findById(patient.doctor);
    final age = DateTime.now().difference(patient.birthDate).inDays ~/ 365;
    final status = table.remarks?.statusString ?? "Pending";
    final gender = patient.gender == Gender.male ? "Male" : "Female";

    return DataRow2(
      onSelectChanged: (value) {
        ref.read(dashboardTabProvider.notifier).addTab(table);
      },
      cells: [
        m3.DataCell(CustomText(patient.name)),
        m3.DataCell(CustomText("$age/$gender")),
        m3.DataCell(CustomText(status)),
        m3.DataCell(CustomText(school.name)),
        if (role) m3.DataCell(CustomText(doctor.name)),
        if (!role) m3.DataCell(CustomText(nurse.name)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
