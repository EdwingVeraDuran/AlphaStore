import 'package:alpha_store/core/layout/widgets/view_layout.dart';
import 'package:alpha_store/features/categories/presentation/page/categories_section.dart';
import 'package:alpha_store/features/stock_entry/presentation/pages/orders_section.dart';
import 'package:alpha_store/features/products/presentation/widgets/products_section.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return ViewLayout(
      view: Column(
        children: [
          ProductsSection(),
          Gap(36),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: CategoriesSection()),
              Gap(24),
              Expanded(flex: 1, child: OrdersSection()),
            ],
          ),
          Gap(24),
        ],
      ),
    );
  }
}
