import 'package:alpha_store/core/util/format_util.dart';
import 'package:alpha_store/features/products/domain/entities/order_item.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class OrderItemList extends StatelessWidget {
  final OrderItem orderItem;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  const OrderItemList({
    super.key,
    required this.orderItem,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: OutlinedContainer(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(FormatUtil.formattedCode(orderItem.product.code)).medium(),
                Gap(4),
                Text(
                  FormatUtil.formattedPrice(orderItem.product.buyPrice),
                ).small(),
              ],
            ),
            Row(
              children: [
                IconButton.ghost(
                  icon: Icon(LucideIcons.minus),
                  onPressed: onDecrement,
                ),
                Gap(8),
                Text(orderItem.amount.toString()).medium(),
                Gap(8),
                IconButton.ghost(
                  icon: Icon(LucideIcons.plus),
                  onPressed: onIncrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
