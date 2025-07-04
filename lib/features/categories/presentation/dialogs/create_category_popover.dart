import 'package:alpha_store/features/categories/domain/entities/category.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateCategoryPopover extends StatefulWidget {
  const CreateCategoryPopover({super.key});

  @override
  State<CreateCategoryPopover> createState() => _CreateCategoryPopoverState();
}

class _CreateCategoryPopoverState extends State<CreateCategoryPopover> {
  final _categoryController = TextEditingController();

  void addCategory(String category) {
    if (category.isEmpty) return;
    _categoryController.clear();

    context.read<CategoriesBloc>().add(AddCategory(Category(name: category)));
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
