import 'package:alpha_store/core/layout/widgets/hidden_scroll.dart';
import 'package:flutter/cupertino.dart';

class ViewLayout extends StatelessWidget {
  final Widget view;
  const ViewLayout({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: HiddenScroll(),
      child: SingleChildScrollView(child: view),
    );
  }
}
