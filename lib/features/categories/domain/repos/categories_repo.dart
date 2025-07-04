import 'package:alpha_store/features/categories/domain/entities/category.dart';

abstract class CategoriesRepo {
  Future<void> addCategory(String category);
  Future<void> removeCategory(int categoryId);
  Future<List<Category>> readCategories();
}
