import 'package:alpha_store/core/shared/entities/feature_action.dart';
import 'package:alpha_store/core/shared/widgets/actions_bar.dart';
import 'package:alpha_store/core/shared/widgets/search_field.dart';
import 'package:alpha_store/features/products/domain/entities/category.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_state.dart';
import 'package:alpha_store/features/products/presentation/dialogs/categories_sheet.dart';
import 'package:alpha_store/features/products/presentation/dialogs/create_product_sheet.dart';
import 'package:alpha_store/features/products/presentation/dialogs/orders_sheet.dart';
import 'package:alpha_store/features/products/presentation/widgets/products_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
    getProducts();
  }

  Future<void> getCategories() async =>
      categories = await context.read<CategoriesRepo>().readCategories();

  Future<void> getProducts() async =>
      context.read<ProductsCubit>().readProducts();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
            ActionsBar(
              actions: [
                FeatureAction(
                  label: 'Categorias',
                  icon: LucideIcons.tag,
                  onPressed:
                      () => openSheet(
                        context: context,
                        builder: (context) => CategoriesSheet(),
                        position: OverlayPosition.right,
                      ),
                ),
                FeatureAction(
                  label: 'Ordenes',
                  icon: LucideIcons.truck,
                  onPressed:
                      () => openSheet(
                        context: context,
                        builder: (context) => OrdersSheet(),
                        position: OverlayPosition.right,
                      ),
                ),
                FeatureAction(
                  label: 'Crear producto',
                  icon: LucideIcons.circlePlus,
                  onPressed:
                      () => openSheet(
                        context: context,
                        builder: (context) => CreateProductSheet(),
                        position: OverlayPosition.right,
                      ),
                ),
              ],
            ),
          ],
        ),
        Gap(24),
        BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductsEmpty) {
              return const Center(child: Text('No hay productos'));
            }

            if (state is ProductsList) {
              return ProductsTable(state.products, categories);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
