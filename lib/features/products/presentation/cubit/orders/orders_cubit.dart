import 'package:alpha_store/features/products/domain/entities/order.dart';
import 'package:alpha_store/features/products/domain/entities/order_item.dart';
import 'package:alpha_store/features/products/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  Future<void> createOrder(Order order, List<OrderItem> items) async {
    try {
      final clientResponse = await ordersRepo.createOrder(order, items);
      if (clientResponse != null) {
        emit(OrderCreated(clientResponse));
        await readOrders();
      }
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  Future<void> deleteOrder(Order order) async {
    try {
      await ordersRepo.deleteOrder(order);
      emit(OrderDeleted(order));
      await readOrders();
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  Future<void> readOrders() async {
    try {
      final clientResponse = await ordersRepo.readOrders();
      emit(OrdersList(clientResponse));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
