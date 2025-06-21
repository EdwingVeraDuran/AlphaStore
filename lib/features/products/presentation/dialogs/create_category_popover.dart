import 'package:alpha_store/features/products/presentation/cubit/categories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateCategoryPopover extends StatefulWidget {
  const CreateCategoryPopover({super.key});

  @override
  State<CreateCategoryPopover> createState() => _CreateCategoryPopoverState();
}

class _CreateCategoryPopoverState extends State<CreateCategoryPopover> {
  final _categoryController = TextEditingController();

  void addCategory(String category) async {
    if (category.isEmpty) return;
    _categoryController.clear();

    context.read<CategoriesCubit>().addCategory(category);
    context.read<CategoriesCubit>().readCategories();
    closeOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      child: SizedBox(
        width: 200,
        child: TextField(
          controller: _categoryController,
          placeholder: Text('Ingresa una categoria'),
          features: [InputFeature.clear()],
          onSubmitted: (value) => addCategory(value),
        ),
      ),
    );
  }
}
