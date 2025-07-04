import 'package:alpha_store/features/categories/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Replace Cubit for Bloc

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;

  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());

  Future<void> addCategory(String category) async {
    emit(CategoriesLoading());
    try {
      await categoriesRepo.addCategory(category);
      emit(CategoryCreated());
      await readCategories();
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> readCategories() async {
    emit(CategoriesLoading());
    try {
      final categories = await categoriesRepo.readCategories();
      emit(CategoriesList(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> deleteCategory(int id) async {
    emit(CategoriesLoading());
    try {
      await categoriesRepo.removeCategory(id);
      emit(CategoryDeleted());
      await readCategories();
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
