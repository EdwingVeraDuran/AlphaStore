import 'package:alpha_store/core/layout/widgets/table_display.dart';
import 'package:alpha_store/core/shared/widgets/table_widgets.dart';
import 'package:alpha_store/core/util/format_util.dart';
import 'package:alpha_store/features/products/domain/entities/product.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ProductsTable extends StatelessWidget {
  final List<Product> data;
  ProductsTable(this.data, {super.key});

  final _tableHeader = TableHeader(
    cells: [
      tableHeaderCell('Código'),
      tableHeaderCell('Nombre'),
      tableHeaderCell('Unidades'),
      tableHeaderCell('# Categoria'),
      tableHeaderCell('Precio Compra', true),
      tableHeaderCell('Precio Venta', true),
    ],
  );

  List<TableRow> buildRows() {
    return data
        .map(
          (e) => TableRow(
            cells: [
              tableCell(FormatUtil.formattedCode(e.code)),
              tableCell(e.name),
              tableCell(e.stock.toString()),
              tableCell(e.categoryId.toString()),
              tableCell(FormatUtil.formattedPrice(e.buyPrice), true),
              tableCell(FormatUtil.formattedPrice(e.sellPrice), true),
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
