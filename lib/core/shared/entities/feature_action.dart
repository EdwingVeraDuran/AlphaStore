import 'package:flutter/cupertino.dart';

class FeatureAction {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  FeatureAction({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
}
