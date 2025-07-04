import 'package:alpha_store/features/categories/domain/entities/category.dart';
import 'package:alpha_store/features/categories/domain/repos/categories_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCategoriesRepo extends CategoriesRepo {
  final categoriesTable = Supabase.instance.client.from('categories');

  @override
  Future<Category?> addCategory(String category) async {
    try {
      final response =
          await categoriesTable.insert({'name': category}).select();
      return Category.fromMap(response.first);
    } catch (e) {
      throw Exception('Error adding category: $e');
    }
  }

  @override
  Future<List<Category>> readCategories() async {
    try {
      final response = await categoriesTable.select();
      return response.map((e) => Category.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error reading categories: $e');
    }
  }

  @override
  Future<Category?> removeCategory(int categoryId) async {
    try {
      final response =
          await categoriesTable.delete().eq('id', categoryId).select();
      return Category.fromMap(response.first);
    } catch (e) {
      throw Exception('Error removing category: $e');
    }
  }
}
