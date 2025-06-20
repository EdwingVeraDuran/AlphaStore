import 'package:alpha_store/features/products/domain/entities/product.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductsRepo implements ProductsRepo {
  final productsTable = Supabase.instance.client.from('products');

  @override
  Future<Product?> createProduct(Product product) async {
    try {
      final clientResponse =
          await productsTable.insert(product.toMap()).select();

      return Product.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error creating product: $e');
    }
  }

  @override
  Future<Product?> deleteProduct(Product product) async {
    try {
      final clientResponse =
          await productsTable.delete().eq('id', product.id!).select();

      return Product.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error deleting product: $e');
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final clientResponse = await productsTable.select();

      return clientResponse.map((e) => Product.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error getting products: $e');
    }
  }

  @override
  Future<Product?> getProductByCode(String code) async {
    try {
      final clientResponse = await productsTable.select().eq('code', code);
      
      if (clientResponse.isEmpty) return null;
      
      return Product.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error getting product by code: $e');
    }
  }

  @override
  Future<bool> productCodeExists(String code) async {
    try {
      final clientResponse = await productsTable.select().eq('code', code);
      return clientResponse.isNotEmpty;
    } catch (e) {
      throw Exception('Error checking product code: $e');
    }
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    try {
      final clientResponse = await productsTable.select().or(
        "code.ilike.%$query%,name.ilike.%$query%",
      );

      return clientResponse.map((e) => Product.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error searching products: $e');
    }
  }

  @override
  Future<Product?> updateProduct(Product product) async {
    try {
      final clientResponse =
          await productsTable
              .update(product.toMap())
              .eq('id', product.id!)
              .select();

      return Product.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error updating product: $e');
    }
  }
}
