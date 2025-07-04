import 'package:shadcn_flutter/shadcn_flutter.dart';

class TableDisplay extends StatefulWidget {
  final TableRow tableHeader;
  final List<TableRow> tableData;
  const TableDisplay({
    super.key,
    required this.tableHeader,
    required this.tableData,
  });

  @override
  State<TableDisplay> createState() => _TableDisplayState();
}

class _TableDisplayState extends State<TableDisplay> {
  int _rowsNumber = 10;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedContainer(
          clipBehavior: Clip.hardEdge,
          child: Table(rows: [widget.tableHeader, ...widget.tableData]),
        ),
        Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [rowsNumber(), pagination()],
        ),
      ],
    );
  }

  Widget rowsNumber() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Número de filas'),
        Gap(12),
        Select<String>(
          itemBuilder: (context, value) {
            return Text(value);
          },
          popupConstraints: BoxConstraints(maxWidth: 200, maxHeight: 300),
          onChanged: (value) {
            setState(() {
              _rowsNumber = int.parse(value!);
            });
          },
          value: _rowsNumber.toString(),
          // ignore: implicit_call_tearoffs
          popup: SelectPopup(
            items: SelectItemList(
              children: [
                SelectItemButton(value: 10, child: Text('10')),
                SelectItemButton(value: 20, child: Text('20')),
                SelectItemButton(value: 30, child: Text('30')),
                SelectItemButton(value: 40, child: Text('40')),
                SelectItemButton(value: 50, child: Text('50')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget pagination() {
    return Pagination(
      page: _page,
      totalPages: 3,
      showLabel: false,
      onPageChanged: (value) {
        setState(() {
          _page = value;
        });
      },
    );
  }
}
