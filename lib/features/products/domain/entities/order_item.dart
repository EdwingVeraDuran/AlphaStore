import 'package:alpha_store/features/products/domain/entities/product.dart';

class OrderItem {
  final Product product;
  int amount;

  OrderItem({required this.product, required this.amount});

  double get totalPrice => product.buyPrice * amount;

  void increment() => amount += 1;

  void decrement() => amount -= 1;
}
