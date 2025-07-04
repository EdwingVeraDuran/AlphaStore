import 'package:alpha_store/core/layout/widgets/table_display.dart';
import 'package:alpha_store/core/shared/widgets/table_widgets.dart';
import 'package:alpha_store/features/categories/domain/entities/category.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CategoriesTable extends StatelessWidget {
  final List<Category> data;
  CategoriesTable(this.data, {super.key});

  final _tableHeader = TableHeader(
    cells: [tableHeaderCell('Código'), tableHeaderCell('Nombre')],
  );

  List<TableRow> buildRows() =>
      data
          .map(
            (e) => TableRow(
              cells: [tableCell(e.id.toString()), tableCell(e.name)],
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return TableDisplay(tableHeader: _tableHeader, tableData: buildRows());
  }
}
