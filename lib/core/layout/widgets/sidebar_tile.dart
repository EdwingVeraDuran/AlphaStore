import 'package:shadcn_flutter/shadcn_flutter.dart';

class SidebarTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const SidebarTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: GhostButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, size: 18),
            SizedBox(width: 16),
            Text(label).normal.base,
          ],
        ),
      ),
    );
  }
}
