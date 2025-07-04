import 'package:alpha_store/features/customers/domain/entities/customer.dart';

sealed class CustomerEvent {}

class LoadCustomers extends CustomerEvent {}

class AddCustomer extends CustomerEvent {
  final Customer customer;
  AddCustomer(this.customer);
}

class UpdateCustomer extends CustomerEvent {
  final Customer customer;
  UpdateCustomer(this.customer);
}

class DeleteCustomer extends CustomerEvent {
  final Customer customer;
  DeleteCustomer(this.customer);
}

class SearchCustomer extends CustomerEvent {
  final String query;
  SearchCustomer(this.query);
}
