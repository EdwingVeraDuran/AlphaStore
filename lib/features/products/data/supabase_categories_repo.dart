import 'package:alpha_store/features/products/domain/entities/category.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCategoriesRepo extends CategoriesRepo {
  final categoriesTable = Supabase.instance.client.from('categories');

  @override
  Future<void> addCategory(String category) async {
    try {
      await categoriesTable.insert({'name': category});
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
  Future<void> removeCategory(int categoryId) async {
    try {
      await categoriesTable.delete().eq('id', categoryId);
    } catch (e) {
      throw Exception('Error removing category: $e');
    }
  }
}
