import 'package:alpha_store/core/shared/entities/operation_status.dart';
import 'package:alpha_store/core/util/app_logger.dart';
import 'package:alpha_store/features/categories/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoryState> {
  final CategoriesRepo categoriesRepo;

  CategoriesBloc(this.categoriesRepo) : super(CategoryInitial()) {
    on<AddCategory>(_onAddCategory);
    on<LoadCategories>(_onReadCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    AppLogger().error('CategoryBloc Error', error, stackTrace);
    super.onError(error, stackTrace);
  }

  Future<void> _onAddCategory(
    AddCategory event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      final response = await categoriesRepo.addCategory(event.category.name);

      if (response == null) {
        emit(
          CategoryFeedbackState(
            OperationStatus.errorAdd(
              'No se ha podido crear la categoría: ${event.category.name}',
            ),
          ),
        );
      } else {
        emit(
          CategoryFeedbackState(
            OperationStatus.succesAdd('Se ha creado la categoría con exito.'),
          ),
        );
        add(LoadCategories());
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> _onReadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final categories = await categoriesRepo.readCategories();
      categories.isEmpty
          ? emit(CategoryEmpty())
          : emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final response = await categoriesRepo.removeCategory(event.category.id!);
      if (response == null) {
        emit(
          CategoryFeedbackState(
            OperationStatus.errorDelete(
              'No se ha podido eliminar la categoría: ${event.category.name}',
            ),
          ),
        );
      } else {
        emit(
          CategoryFeedbackState(
            OperationStatus.successDelete(
              'Se ha eliminado la categoría con exito.',
            ),
          ),
        );
        add(LoadCategories());
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
