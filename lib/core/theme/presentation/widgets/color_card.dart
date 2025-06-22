import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ColorCard extends StatelessWidget {
  final AppColor appColor;
  final Color color;
  const ColorCard({super.key, required this.color, required this.appColor});

  @override
  Widget build(BuildContext context) {
    return RadioCard(
      value: appColor,
      child: Container(
        width: 30 * Theme.of(context).scaling,
        height: 30 * Theme.of(context).scaling,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
