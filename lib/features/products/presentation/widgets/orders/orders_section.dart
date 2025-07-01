import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders/orders_state.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:alpha_store/features/products/presentation/dialogs/create_order_sheet.dart';
import 'package:alpha_store/features/products/presentation/widgets/orders/orders_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class OrdersSection extends StatefulWidget {
  const OrdersSection({super.key});

  @override
  State<OrdersSection> createState() => _OrdersSectionState();
}

class _OrdersSectionState extends State<OrdersSection> {
  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().readOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(label: 'Pedidos', icon: LucideIcons.truck),
            ActionButton(
              icon: LucideIcons.circlePlus,
              label: 'Crear pedido',
              onPressed:
                  () => openSheet(
                    context: context,
                    builder: (context) => CreateOrderSheet(),
                    position: OverlayPosition.right,
                  ),
            ),
          ],
        ),
        Gap(24),
        BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {
            if (state is OrderCreated) {
              context.read<ProductsCubit>().readProducts();
            }
          },
          builder: (context, state) {
            if (state is OrdersLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is OrdersError) {
              return Center(child: Text(state.message));
            }

            if (state is OrdersEmpty) {
              return Center(child: Text('No hay pedidos'));
            }

            if (state is OrdersList) {
              return OrdersTable(state.orders);
            }

            return Container();
          },
        ),
      ],
    );
  }
}
