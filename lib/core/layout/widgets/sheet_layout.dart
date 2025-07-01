import 'package:flutter/cupertino.dart';

class SheetLayout extends StatelessWidget {
  final Widget child;
  const SheetLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      constraints: BoxConstraints(maxWidth: 400),
      child: child,
    );
  }
}
