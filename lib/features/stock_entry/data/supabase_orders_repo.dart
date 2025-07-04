import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry.dart';
import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_detail.dart';
import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_item.dart';
import 'package:alpha_store/features/stock_entry/domain/repos/orders_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseOrdersRepo implements OrdersRepo {
  final ordersTable = Supabase.instance.client.from('orders');
  final orderDetailsTable = Supabase.instance.client.from('order_detail');

  @override
  Future<StockEntry?> createOrder(
    StockEntry order,
    List<StockEntryItem> items,
  ) async {
    try {
      final orderResponse = await ordersTable.insert(order.toMap()).select();
      final orderId = orderResponse.first['id'];
      final orderDetails =
          items.map((e) => StockEntryDetail.fromItem(e, orderId)).toList();
      await orderDetailsTable.insert(
        orderDetails.map((e) => e.toMap()).toList(),
      );
      return StockEntry.fromMap(orderResponse.first);
    } catch (e) {
      throw Exception('Error creating order: $e');
    }
  }

  @override
  Future<StockEntry?> deleteOrder(StockEntry order) async {
    try {
      final clientResponse =
          await ordersTable.delete().eq('id', order.id!).select();
      await orderDetailsTable.delete().eq('order_id', order.id!);
      return StockEntry.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error deleting order: $e');
    }
  }

  @override
  Future<List<StockEntryDetail>> readOrderDetails(int orderId) async {
    try {
      final clientResponse = await orderDetailsTable.select().eq(
        'order_id',
        orderId,
      );
      return clientResponse.map((e) => StockEntryDetail.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error reading order details: $e');
    }
  }

  @override
  Future<List<StockEntry>> readOrders() async {
    try {
      final clientResponse = await ordersTable.select();
      return clientResponse.map((e) => StockEntry.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error reading orders: $e');
    }
  }
}
