import 'package:alpha_store/features/categories/domain/entities/category.dart';

abstract class CategoriesRepo {
  Future<Category?> addCategory(String category);
  Future<Category?> removeCategory(int categoryId);
  Future<List<Category>> readCategories();
}
