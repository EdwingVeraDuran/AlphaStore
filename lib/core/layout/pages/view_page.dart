import 'package:alpha_store/core/layout/entities/sidebar_item.dart';
import 'package:alpha_store/core/layout/widgets/hidden_scroll.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ViewPage extends StatelessWidget {
  final SidebarItem sidebarItem;
  const ViewPage({super.key, required this.sidebarItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 24,
            child: Row(
              children: [
                Icon(sidebarItem.icon),
                Gap(16),
                VerticalDivider(indent: 2, endIndent: 2),
                Gap(16),
                Text(sidebarItem.label).semiBold,
              ],
            ),
          ),
          Gap(16),
          Divider(),
          Gap(16),
          Expanded(
            child: ScrollConfiguration(
              behavior: HiddenScroll(),
              child: sidebarItem.view,
            ),
          ),
        ],
      ),
    );
  }
}
