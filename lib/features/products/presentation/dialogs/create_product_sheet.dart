import 'package:alpha_store/features/products/domain/entities/category.dart';
import 'package:alpha_store/features/products/domain/entities/product.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories/categories_state.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateProductSheet extends StatefulWidget {
  const CreateProductSheet({super.key});

  @override
  State<CreateProductSheet> createState() => _CreateProductSheetState();
}

class _CreateProductSheetState extends State<CreateProductSheet> {
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  int? _stockController;
  Category? _categoryController;
  double? _buyPriceController;
  double? _sellPriceController;

  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().readCategories();
  }

  List<Category> _filteredCategories(String query) {
    return categories
        .where((element) => element.name.toLowerCase().contains(query))
        .toList();
  }

  void validateProductData() async {
    final code = _codeController.text;
    final name = _nameController.text;
    final stock = _stockController;
    final categoryId = _categoryController?.id;
    final buyPrice = _buyPriceController;
    final sellPrice = _sellPriceController;

    if (code.isEmpty ||
        name.isEmpty ||
        stock == null ||
        categoryId == null ||
        buyPrice == null ||
        sellPrice == null) {
      return;
    }

    if (stock <= 0 || buyPrice <= 0 || sellPrice <= 0) {
      return;
    }

    if (code.length < 3 || name.length < 3) {
      return;
    }

    if (code.length > 10 || name.length > 50) {
      return;
    }

    if (await context.read<ProductsCubit>().productCodeExists(code)) {
      return;
    }

    //TODO: Complete validation with toast

    final product = Product(
      code: code,
      name: name,
      stock: stock,
      categoryId: categoryId,
      buyPrice: buyPrice,
      sellPrice: sellPrice,
    );

    createProduct(product);
  }

  void createProduct(Product product) async {
    closeSheet(context);
    await context.read<ProductsCubit>().createProduct(product);
    getProducts();
  }

  void getProducts() {
    context.read<ProductsCubit>().readProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Crear producto').large().medium(),
          Gap(16),
          Column(
            children: [
              TextField(
                controller: _codeController,
                placeholder: Text('Código'),
              ),
              Gap(16),
              TextField(
                controller: _nameController,
                placeholder: Text('Nombre'),
              ),
              Gap(16),
              TextField(
                initialValue: _stockController?.toString(),
                onChanged:
                    (value) => setState(() {
                      _stockController = int.tryParse(value) ?? 0;
                    }),
                features: [InputFeature.spinner()],
                submitFormatters: [TextInputFormatters.mathExpression()],
                placeholder: Text('Unidades'),
              ),
              Gap(16),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesList) {
                    categories = state.categories;
                  }

                  return Select<Category>(
                    // ignore: implicit_call_tearoffs
                    popup: SelectPopup.builder(
                      searchPlaceholder: Text('Seleccionar categoría'),
                      builder: (context, searchQuery) {
                        final filteredCategories =
                            searchQuery == null
                                ? categories
                                : _filteredCategories(searchQuery);
                        return SelectItemList(
                          children:
                              filteredCategories
                                  .map(
                                    (e) => SelectItemButton(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    ),
                    itemBuilder: (context, value) {
                      return Text(value.name);
                    },
                    onChanged:
                        (value) => setState(() {
                          _categoryController = value;
                        }),
                    value: _categoryController,
                    placeholder: Text('Categoría'),
                    constraints: BoxConstraints(minWidth: 360),
                  );
                },
              ),
              Gap(16),
              TextField(
                initialValue: _buyPriceController?.toString(),
                onChanged:
                    (value) => setState(() {
                      _buyPriceController = double.tryParse(value) ?? 0;
                    }),
                features: [InputFeature.spinner()],
                submitFormatters: [TextInputFormatters.mathExpression()],
                placeholder: Text('Precio Compra'),
              ),
              Gap(16),
              TextField(
                initialValue: _sellPriceController?.toString(),
                onChanged:
                    (value) => setState(() {
                      _sellPriceController = double.tryParse(value) ?? 0;
                    }),
                features: [InputFeature.spinner()],
                submitFormatters: [TextInputFormatters.mathExpression()],
                placeholder: Text('Precio Venta'),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlineButton(
                child: Text('Cancelar'),
                onPressed: () => closeSheet(context),
              ),
              Gap(16),
              PrimaryButton(
                onPressed: validateProductData,
                child: Text('Crear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
