import 'package:alpha_store/features/customers/domain/entities/customer.dart';

abstract class CustomerRepo {
  Future<Customer?> addCustomer(Customer customer);
  Future<Customer?> deleteCustomer(Customer customer);
  Future<Customer?> updateCustomer(Customer customer);
  Future<List<Customer>> getCustomers();
  Future<List<Customer>> searchCustomers(String query);
  Future<bool> customerPhoneExists(String phone);
}
