import 'package:alpha_store/features/products/domain/entities/category.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CategoriesSheet extends StatefulWidget {
  const CategoriesSheet({super.key});

  @override
  State<CategoriesSheet> createState() => _CategoriesSheetState();
}

class _CategoriesSheetState extends State<CategoriesSheet> {
  final _categoryController = TextEditingController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    readCategories();
  }

  void addCategory(String category) async {
    if (category.isEmpty) return;
    _categoryController.clear();

    await context.read<CategoriesCubit>().addCategory(category);
    readCategories();
  }

  void deleteCategory(Category category) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eliminar categoria'),
          content: Text(
            '¿Estas seguro de eliminar la categoria ${category.name}?',
          ),
          actions: [
            OutlineButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            DestructiveButton(
              child: Text('Eliminar'),
              onPressed: () async {
                Navigator.pop(context);
                await context.read<CategoriesCubit>().deleteCategory(
                  category.id!,
                );
                readCategories();
              },
            ),
          ],
        );
      },
    );
  }

  void readCategories() async {
    await context.read<CategoriesCubit>().readCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categorias').large().medium(),
          Gap(16),
          TextField(
            controller: _categoryController,
            placeholder: Text('Ingresa una categoria'),
            features: [InputFeature.clear()],
            onSubmitted: (value) => addCategory(value),
          ),
          Gap(16),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesList) {
                categories = state.categories;
              }

              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    categories
                        .map(
                          (e) => Chip(
                            trailing: ChipButton(
                              child: Icon(LucideIcons.x),
                              onPressed: () => deleteCategory(e),
                            ),
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
              );
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(
                child: Text('Cerrar'),
                onPressed: () => closeSheet(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
