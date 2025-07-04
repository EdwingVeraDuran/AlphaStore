import 'package:alpha_store/features/customers/domain/entities/customer.dart';
import 'package:alpha_store/features/customers/domain/repos/customer_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCustomerRepo implements CustomerRepo {
  final clientsTable = Supabase.instance.client.from('clients');

  @override
  Future<Customer?> addCustomer(Customer client) async {
    try {
      final clientResponse = await clientsTable.insert(client.toMap()).select();
      return Customer.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error creating client: $e');
    }
  }

  @override
  Future<Customer?> deleteCustomer(Customer client) async {
    try {
      final clientResponse =
          await clientsTable.delete().eq('id', client.id!).select();
      return Customer.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error deleting client: $e');
    }
  }

  @override
  Future<List<Customer>> getCustomers() async {
    try {
      final clientResponse = await clientsTable.select();
      return clientResponse.map((e) => Customer.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error getting clients: $e');
    }
  }

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    try {
      final clientResponse = await clientsTable.select().or(
        'name.ilike.%$query%,phone.ilike.%$query%',
      );
      return clientResponse.map((e) => Customer.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error searching clients: $e');
    }
  }

  @override
  Future<Customer?> updateCustomer(Customer client) async {
    try {
      final clientResponse =
          await clientsTable
              .update(client.toMap())
              .eq('id', client.id!)
              .select();
      return Customer.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error updating client: $e');
    }
  }

  @override
  Future<bool> customerPhoneExists(String phone) async {
    try {
      final clientResponse = await clientsTable.select().eq('phone', phone);
      return clientResponse.isNotEmpty;
    } catch (e) {
      throw Exception('Error checking client phone: $e');
    }
  }
}
