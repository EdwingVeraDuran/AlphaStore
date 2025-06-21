import 'package:alpha_store/features/products/domain/entities/order.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrderCreated extends OrdersState {
  final Order order;

  OrderCreated(this.order);
}

class OrderDeleted extends OrdersState {
  final Order order;

  OrderDeleted(this.order);
}

class OrdersList extends OrdersState {
  final List<Order> orders;

  OrdersList(this.orders);
}

class OrdersEmpty extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}
