import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders_state.dart';
import 'package:alpha_store/features/products/presentation/dialogs/create_order_sheet.dart';
import 'package:alpha_store/features/products/presentation/widgets/orders_table.dart';
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

            OutlineButton(
              trailing: Icon(LucideIcons.circlePlus),
              onPressed:
                  () => openSheet(
                    context: context,
                    builder: (context) => CreateOrderSheet(),
                    position: OverlayPosition.right,
                  ),
              child: Text('Crear pedido'),
            ),
          ],
        ),
        Gap(24),
        BlocBuilder<OrdersCubit, OrdersState>(
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
