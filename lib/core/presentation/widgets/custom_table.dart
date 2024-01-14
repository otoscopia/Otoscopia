import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class CustomTable extends ConsumerWidget {
  const CustomTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserRole role = ref.read(userProvider).role;
    bool nurse = role == UserRole.nurse;
    bool doctor = role == UserRole.doctor;

    m3.DataTableSource source = TableSource(ref, nurse, doctor);

    return Card(
      padding: EdgeInsets.zero,
      child: PaginatedDataTable2(
        dividerThickness: 0,
        showCheckboxColumn: false,
        minWidth: 1000,
        empty: const Center(child: Text(kNoDataAvailable)),
        headingRowColor: const m3.MaterialStatePropertyAll(Colors.transparent),
        sortArrowAlwaysVisible: true,
        rowsPerPage: 20,
        columns: [
          const DataColumn2(label: Text(kName)),
          const DataColumn2(label: Text(kAgeAndGender), size: ColumnSize.S),
          const DataColumn2(label: Text(kStatus), size: ColumnSize.S),
          const DataColumn2(label: Text(kSchool)),
          if (nurse) const DataColumn2(label: Text(kDoctor)),
          if (doctor) const DataColumn2(label: Text(kNurse)),
        ],
        source: source,
      ),
    );
  }
}

class TableSource extends m3.DataTableSource {
  final WidgetRef ref;
  final List<TableEntity> _data = [];
  final bool nurse;
  final bool doctor;

  TableSource(this.ref, this.nurse, this.doctor);

  @override
  m3.DataRow? getRow(int index) {
    final TableEntity table = _data[index];
    final PatientEntity patient = table.patient;
    final ScreeningEntity screening = table.screening;
    final AssignmentEntity assignment = table.assignment;
    final int age = DateTime.now().difference(patient.birthDate).inDays ~/ 365;
    final String status = convertRecordStatus(screening.status);

    return DataRow2(
      onSelectChanged: (value) {
        ref.read(dashboardTabProvider.notifier).addTab(table);
      },
      cells: [
        m3.DataCell(Text(patient.name)),
        m3.DataCell(Text("$age/${patient.gender}")),
        m3.DataCell(Text(status)),
        m3.DataCell(Text(patient.school)),
        if (nurse) m3.DataCell(Text(patient.doctor)),
        if (doctor) m3.DataCell(Text(assignment.nurse)),
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
