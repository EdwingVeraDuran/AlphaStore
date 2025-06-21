import 'package:alpha_store/features/products/domain/entities/order.dart';
import 'package:alpha_store/features/products/domain/entities/order_detail.dart';
import 'package:alpha_store/features/products/domain/entities/order_item.dart';

abstract class OrdersRepo {
  Future<Order?> createOrder(Order order, List<OrderItem> items);
  Future<Order?> deleteOrder(Order order);
  Future<List<Order>> readOrders();
  Future<List<OrderDetail>> readOrderDetails(int orderId);
}
