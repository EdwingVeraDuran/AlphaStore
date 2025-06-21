import 'package:alpha_store/core/layout/widgets/table_display.dart';
import 'package:alpha_store/core/shared/widgets/table_widgets.dart';
import 'package:alpha_store/core/util/format_util.dart';
import 'package:alpha_store/features/products/domain/entities/order.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class OrdersTable extends StatelessWidget {
  final List<Order> data;
  OrdersTable(this.data, {super.key});

  final _tableHeader = TableHeader(
    cells: [
      tableHeaderCell('Código'),
      tableHeaderCell('Fecha'),
      tableHeaderCell('Total', true),
    ],
  );

  List<TableRow> buildRows() {
    return data
        .map(
          (e) => TableRow(
            cells: [
              tableCell(e.id.toString()),
              tableCell(FormatUtil.formattedDate(e.createdAt)),
              tableCell(FormatUtil.formattedPrice(e.total), true),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TableDisplay(tableHeader: _tableHeader, tableData: buildRows());
  }
}
