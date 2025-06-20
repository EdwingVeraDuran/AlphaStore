class OrderDetail {
  final int? id;
  final int orderId;
  final int productId;
  final int amount;
  final double unitPrice;
  final double subtotal;

  OrderDetail({
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

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: map['id'],
      orderId: map['order_id'],
      productId: map['product_id'],
      amount: map['amount'],
      unitPrice: (map['unit_price'] as num).toDouble(),
      subtotal: (map['subtotal'] as num).toDouble(),
    );
  }
}
