import 'package:alpha_store/features/categories/domain/entities/category.dart';

sealed class CategoriesEvent {}

class AddCategory extends CategoriesEvent {
  final Category category;
  AddCategory(this.category);
}

class LoadCategories extends CategoriesEvent {}

class DeleteCategory extends CategoriesEvent {
  final Category category;
  DeleteCategory(this.category);
}
