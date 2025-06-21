import 'package:alpha_store/features/products/domain/entities/category.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoryCreated extends CategoriesState {}

class CategoryDeleted extends CategoriesState {}

class CategoriesList extends CategoriesState {
  final List<Category> categories;

  CategoriesList(this.categories);
}

class CategoriesEmpty extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
