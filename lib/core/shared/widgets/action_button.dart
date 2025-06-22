import 'package:shadcn_flutter/shadcn_flutter.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      trailing: Icon(icon),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
