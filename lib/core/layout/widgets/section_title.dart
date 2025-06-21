import 'package:shadcn_flutter/shadcn_flutter.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  final IconData icon;
  const SectionTitle({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Gap(16),
          VerticalDivider(indent: 2, endIndent: 2),
          Gap(16),
          Text(label).semiBold,
        ],
      ),
    );
  }
}
