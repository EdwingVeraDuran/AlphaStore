import 'package:alpha_store/core/util/format_util.dart';
import 'package:alpha_store/features/products/domain/entities/order.dart';
import 'package:alpha_store/features/products/presentation/dialogs/create_order_sheet.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class OrdersSheet extends StatefulWidget {
  const OrdersSheet({super.key});

  @override
  State<OrdersSheet> createState() => _OrdersSheetState();
}

class _OrdersSheetState extends State<OrdersSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ordenes').large().medium(),
          Gap(16),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false, overscroll: false),
              child: SingleChildScrollView(child: Column(children: test())),
            ),
          ),
          Divider(),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlineButton(
                onPressed: () => closeSheet(context),
                child: Text('Cerrar'),
              ),
              Gap(16),
              PrimaryButton(
                onPressed: () {
                  closeSheet(context);
                  openSheet(
                    context: context,
                    builder: (context) => CreateOrderSheet(),
                    position: OverlayPosition.right,
                  );
                },
                child: Text('Crear'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> test() {
    return [
      section(DateTime.now(), [
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
      ]),
      section(DateTime.now(), [
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
      ]),
      section(DateTime.now(), [
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
      ]),
      section(DateTime.now(), [
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
        Order(id: 10000, total: 1000000, createdAt: DateTime.now()),
      ]),
    ];
  }

  Widget section(DateTime date, List<Order> orders) {
    return Column(
      children: [
        Divider(child: Text('${date.day}/${date.month}/${date.year}').medium()),
        Gap(8),
        ...orders.map(
          (order) => GhostButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('#${order.id}').medium(),
                Gap(8),
                Text(FormatUtil.formattedPrice(order.total)).medium(),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Gap(8),
      ],
    );
  }
}
