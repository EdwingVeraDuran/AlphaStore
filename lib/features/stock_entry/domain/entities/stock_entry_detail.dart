import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_item.dart';

class StockEntryDetail {
  final int? id;
  final int orderId;
  final int productId;
  final int amount;
  final double unitPrice;
  final double subtotal;

  StockEntryDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.amount,
    required this.unitPrice,
    required this.subtotal,
  });

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'product_id': productId,
      'amount': amount,
      'unit_price': unitPrice,
      'subtotal': subtotal,
    };
  }

  factory StockEntryDetail.fromMap(Map<String, dynamic> map) {
    return StockEntryDetail(
      id: map['id'],
      orderId: map['order_id'],
      productId: map['product_id'],
      amount: map['amount'],
      unitPrice: (map['unit_price'] as num).toDouble(),
      subtotal: (map['subtotal'] as num).toDouble(),
    );
  }

  factory StockEntryDetail.fromItem(StockEntryItem orderItem, int orderId) {
    return StockEntryDetail(
      id: null,
      orderId: orderId,
      productId: orderItem.product.id!,
      amount: orderItem.amount,
      unitPrice: orderItem.product.buyPrice,
      subtotal: orderItem.totalPrice,
    );
  }
}
