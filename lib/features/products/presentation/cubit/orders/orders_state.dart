import 'package:alpha_store/features/products/domain/entities/stock_entry.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrderCreated extends OrdersState {
  final StockEntry order;

  OrderCreated(this.order);
}

class OrderDeleted extends OrdersState {
  final StockEntry order;

  OrderDeleted(this.order);
}

class OrdersList extends OrdersState {
  final List<StockEntry> orders;

  OrdersList(this.orders);
}

class OrdersEmpty extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}
