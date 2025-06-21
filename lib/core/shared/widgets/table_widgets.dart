import 'package:shadcn_flutter/shadcn_flutter.dart';

TableCell tableHeaderCell(String label, [bool alignRight = false]) {
  return TableCell(
    child: Container(
      margin: const EdgeInsets.all(8),
      alignment: alignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: Text(label).muted().semiBold(),
    ),
  );
}

TableCell tableCell(String label, [bool alignRight = false]) {
  return TableCell(
    child: GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(label),
      ),
      onTap: () {},
    ),
  );
}

TableCell categoryCell(String label) {
  return TableCell(
    child: GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: Chip(style: ButtonStyle.secondary(), child: Text(label)),
      ),
      onTap: () {},
    ),
  );
}
