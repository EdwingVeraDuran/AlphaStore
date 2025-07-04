import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry.dart';
import 'package:alpha_store/features/stock_entry/domain/entities/stock_entry_item.dart';
import 'package:alpha_store/features/stock_entry/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/stock_entry/presentation/bloc/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  Future<void> createOrder(StockEntry order, List<StockEntryItem> items) async {
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

  Future<void> deleteOrder(StockEntry order) async {
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
