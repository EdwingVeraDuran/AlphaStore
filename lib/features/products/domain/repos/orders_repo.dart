import 'package:alpha_store/features/products/domain/entities/order.dart';
import 'package:alpha_store/features/products/domain/entities/order_item.dart';

abstract class OrdersRepo {
  Future<Order> createOrder(Order order, List<OrderItem> items);
}
