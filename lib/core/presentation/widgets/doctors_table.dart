import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class DoctorsTable extends ConsumerWidget {
  const DoctorsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctors = ref.read(doctorsProvider);
    final source = DoctorsTableSource(ref, doctors);
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
        source: source,
        columns: const [
          DataColumn2(label: Text(kName)),
          DataColumn2(label: Text(kWorkAddress)),
        ],
      ),
    );
  }
}

class DoctorsTableSource extends m3.DataTableSource {
  final WidgetRef ref;
  final List<UsersEntity> _doctors;

  DoctorsTableSource(this.ref, this._doctors);

  @override
  m3.DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        m3.DataCell(Text(_doctors[index].name)),
        m3.DataCell(Text(_doctors[index].workAddress)),
      ],
      onSelectChanged: (value) {
        ref.read(doctorsTabProvider.notifier).addTab(_doctors[index]);
      },
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _doctors.length;

  @override
  int get selectedRowCount => 0;
}
