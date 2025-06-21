import 'package:alpha_store/core/layout/widgets/section_title.dart';
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
              onPressed: () {},
              child: Text('Crear pedido'),
            ),
          ],
        ),
        Gap(24),
      ],
    );
  }
}
