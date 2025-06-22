import 'package:alpha_store/core/shared/icons/my_flutter_app_icons.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Row(
        children: [
          Icon(MyFlutterApp.logo),
          Gap(16),
          Text('Alpha Store').semiBold.base,
        ],
      ),
      onPressed: () {},
    );
  }
}
