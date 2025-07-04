import 'package:alpha_store/core/shared/entities/operation_status.dart';
import 'package:alpha_store/features/customers/domain/entities/customer.dart';

sealed class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<Customer> customers;
  CustomerLoaded(this.customers);
}

class CustomerEmpty extends CustomerState {}

class CustomerFeedbackState extends CustomerState {
  final OperationStatus status;

  CustomerFeedbackState(this.status);
}

class CustomerError extends CustomerState {
  final String message;
  CustomerError(this.message);
}
