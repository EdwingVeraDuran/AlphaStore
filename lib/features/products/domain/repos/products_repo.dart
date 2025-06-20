import 'package:alpha_store/features/products/domain/entities/product.dart';

abstract class ProductsRepo {
  Future<Product?> createProduct(Product product);
  Future<List<Product>> getProducts();
  Future<Product?> getProductByCode(String code);
  Future<List<Product>> searchProducts(String query);
  Future<Product?> updateProduct(Product product);
  Future<Product?> deleteProduct(Product product);
  Future<bool> productCodeExists(String code);
}
