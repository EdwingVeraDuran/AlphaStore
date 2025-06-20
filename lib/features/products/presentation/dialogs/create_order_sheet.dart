import 'package:alpha_store/core/util/format_util.dart';
import 'package:alpha_store/features/products/domain/entities/order_item.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/widgets/order_item_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateOrderSheet extends StatefulWidget {
  const CreateOrderSheet({super.key});

  @override
  State<CreateOrderSheet> createState() => _CreateOrderSheetState();
}

class _CreateOrderSheetState extends State<CreateOrderSheet> {
  final _productCodeController = TextEditingController();
  List<OrderItem> products = [];

  bool codeExists(String productCode) =>
      products.any((e) => e.product.code == productCode);

  double get total => products.fold(0, (p, c) => p + c.totalPrice);

  void addProduct(String productCode) async {
    _productCodeController.clear();

    if (productCode.isEmpty) {
      return;
    }

    if (codeExists(productCode)) {
      final item = products.firstWhere((e) => e.product.code == productCode);
      setState(() {
        item.increment();
      });
      return;
    }

    final product = await context.read<ProductsRepo>().getProductByCode(
      productCode,
    );
    if (product == null) return;
    products.add(OrderItem(product: product, amount: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Crear orden').large().medium(),
          Gap(16),
          TextField(
            placeholder: Text('Código producto'),
            controller: _productCodeController,
            onSubmitted: addProduct,
            features: [InputFeature.clear()],
          ),
          Gap(16),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false, overscroll: false),
              child: SingleChildScrollView(
                child: Column(
                  children:
                      products
                          .map(
                            (e) => OrderItemList(
                              orderItem: e,
                              onDecrement: () {
                                setState(() {
                                  if (e.amount == 1) {
                                    products.remove(e);
                                  }
                                  e.decrement();
                                });
                              },
                              onIncrement: () => setState(() => e.increment()),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(FormatUtil.formattedPrice(total)).xLarge().medium(),
              PrimaryButton(child: Text('Crear'), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
