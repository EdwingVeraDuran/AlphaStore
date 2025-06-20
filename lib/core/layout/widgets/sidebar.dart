import 'package:alpha_store/core/layout/entities/sidebar_item.dart';
import 'package:alpha_store/core/layout/widgets/sidebar_header.dart';
import 'package:alpha_store/core/layout/widgets/sidebar_tile.dart';
import 'package:alpha_store/core/layout/widgets/app_actions.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;
  final List<SidebarItem> data;
  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SidebarHeader(),
        Gap(12),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder:
                (context, index) => SidebarTile(
                  icon: data[index].icon,
                  label: data[index].label,
                  onPressed: () => onIndexChanged(index),
                ),
          ),
        ),
        Spacer(),
        AppActions(),
      ],
    );
  }
}
