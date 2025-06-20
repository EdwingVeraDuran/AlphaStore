import 'package:alpha_store/core/layout/entities/sidebar_data.dart';
import 'package:alpha_store/core/layout/pages/view_page.dart';
import 'package:alpha_store/core/layout/widgets/sidebar.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final _data = SidebarData.items;
  int _selectedIndex = 0;

  void selectIndex(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryForeground,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Sidebar(
                data: _data,
                onIndexChanged: selectIndex,
                selectedIndex: _selectedIndex,
              ),
            ),
            Gap(16),
            Expanded(child: ViewPage(sidebarItem: _data[_selectedIndex])),
          ],
        ),
      ),
    );
  }
}
