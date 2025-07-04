import 'package:alpha_store/core/layout/widgets/table_display.dart';
import 'package:alpha_store/core/shared/widgets/table_widgets.dart';
import 'package:alpha_store/features/customers/domain/entities/customer.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CustomerTable extends StatelessWidget {
  final List<Customer> data;
  CustomerTable(this.data, {super.key});

  final _tableHeader = TableHeader(
    cells: [
      tableHeaderCell('Nombre'),
      tableHeaderCell('Teléfono'),
      tableHeaderCell('Dirección'),
      tableHeaderCell('Barrio'),
    ],
  );

  List<TableRow> buildRows() =>
      data
          .map(
            (e) => TableRow(
              cells: [
                tableCell(e.name),
                tableCell(e.phone),
                tableCell(e.address),
                tableCell(e.hood),
              ],
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return TableDisplay(tableHeader: _tableHeader, tableData: buildRows());
  }
}
