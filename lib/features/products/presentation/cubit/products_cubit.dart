import 'package:alpha_store/features/products/domain/entities/product.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit({required this.productsRepo}) : super(ProductsInitial());

  Future<void> createProduct(Product product) async {
    try {
      final clientResponse = await productsRepo.createProduct(product);

      if (clientResponse != null) {
        emit(ProductCreated(clientResponse));
      }
    } catch (e) {
      throw Exception('Error creating product: $e');
    }
  }

  Future<void> deleteProduct(Product product) async {
    try {
      final clientResponse = await productsRepo.deleteProduct(product);

      if (clientResponse != null) {
        emit(ProductDeleted(clientResponse));
      }
    } catch (e) {
      throw Exception('Error deleting product: $e');
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      final clientResponse = await productsRepo.updateProduct(product);

      if (clientResponse != null) {
        emit(ProductUpdated(clientResponse));
      }
    } catch (e) {
      throw Exception('Error updating product: $e');
    }
  }

  Future<void> readProducts() async {
    emit(ProductsLoading());
    try {
      final clientResponse = await productsRepo.getProducts();
      clientResponse.isNotEmpty
          ? emit(ProductsList(clientResponse))
          : emit(ProductsEmpty());
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<void> searchProducts(String query) async {
    emit(ProductsLoading());
    try {
      final clientResponse = await productsRepo.searchProducts(query);
      clientResponse.isNotEmpty
          ? emit(ProductsList(clientResponse))
          : emit(ProductsEmpty());
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<bool> productCodeExists(String code) async {
    try {
      final clientResponse = await productsRepo.productCodeExists(code);
      return clientResponse;
    } catch (e) {
      throw Exception('Error checking product code: $e');
    }
  }
}
