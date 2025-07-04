import 'package:alpha_store/core/layout/entities/sidebar_item.dart';
import 'package:alpha_store/features/customers/presentation/pages/customer_view.dart';
import 'package:alpha_store/features/products/presentation/pages/products_view.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SidebarData {
  static List<SidebarItem> items = [
    SidebarItem(
      label: 'Inicio',
      icon: LucideIcons.layoutDashboard,
      view: Container(),
    ),
    SidebarItem(
      label: 'Productos',
      icon: LucideIcons.shoppingCart,
      view: ProductsView(),
    ),
    SidebarItem(
      label: 'Clientes',
      icon: LucideIcons.contactRound,
      view: CustomerView(),
    ),
  ];
}
