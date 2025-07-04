import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry.dart';
import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_detail.dart';
import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_item.dart';

abstract class OrdersRepo {
  Future<StockEntry?> createOrder(StockEntry order, List<StockEntryItem> items);
  Future<StockEntry?> deleteOrder(StockEntry order);
  Future<List<StockEntry>> readOrders();
  Future<List<StockEntryDetail>> readOrderDetails(int orderId);
}
