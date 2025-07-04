import 'package:alpha_store/core/shared/entities/operation_status.dart';
import 'package:alpha_store/features/categories/domain/entities/category.dart';

sealed class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded(this.categories);
}

class CategoryEmpty extends CategoryState {}

class CategoryFeedbackState extends CategoryState {
  final OperationStatus status;
  CategoryFeedbackState(this.status);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
