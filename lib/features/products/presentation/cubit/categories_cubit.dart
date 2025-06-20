import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo productsRepo;

  CategoriesCubit({required this.productsRepo}) : super(CategoriesInitial());

  Future<void> addCategory(String category) async {
    emit(CategoriesLoading());
    try {
      await productsRepo.addCategory(category);
      emit(CategoryCreated());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> readCategories() async {
    emit(CategoriesLoading());
    try {
      final categories = await productsRepo.readCategories();
      emit(CategoriesList(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> deleteCategory(int id) async {
    emit(CategoriesLoading());
    try {
      await productsRepo.removeCategory(id);
      emit(CategoryDeleted());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
