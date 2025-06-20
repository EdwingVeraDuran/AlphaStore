import 'package:shadcn_flutter/shadcn_flutter.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GhostButton(
      child: Row(
        children: [
          Icon(LucideIcons.store),
          Gap(16),
          Text('Alpha Store').semiBold.base,
        ],
      ),
      onPressed: () {},
    );
  }
}
