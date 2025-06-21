import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:alpha_store/core/shared/widgets/search_field.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_state.dart';
import 'package:alpha_store/features/products/presentation/dialogs/create_product_sheet.dart';
import 'package:alpha_store/features/products/presentation/widgets/products/products_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().readProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
            ActionButton(
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
        Gap(24),
        BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductsEmpty) {
              return const Center(child: Text('No hay productos'));
            }

            if (state is ProductsList) {
              return ProductsTable(state.products);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
