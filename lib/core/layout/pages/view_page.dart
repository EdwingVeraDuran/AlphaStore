import 'package:alpha_store/core/layout/entities/sidebar_item.dart';
import 'package:alpha_store/core/layout/widgets/hidden_scroll.dart';
import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ViewPage extends StatelessWidget {
  final SidebarItem sidebarItem;
  const ViewPage({super.key, required this.sidebarItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(label: sidebarItem.label, icon: sidebarItem.icon),
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
