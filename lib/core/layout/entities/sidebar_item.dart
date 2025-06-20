import 'package:shadcn_flutter/shadcn_flutter.dart';

class SidebarItem {
  final String label;
  final IconData icon;
  final Widget view;

  SidebarItem({required this.label, required this.icon, required this.view});
}
