import 'package:alpha_store/features/clients/domain/entities/client.dart';
import 'package:alpha_store/features/clients/domain/repos/clients_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientsRepo implements ClientsRepo {
  final clientsTable = Supabase.instance.client.from('clients');

  @override
  Future<Client?> createClient(Client client) async {
    try {
      final clientResponse = await clientsTable.insert(client.toMap()).select();
      return Client.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error creating client: $e');
    }
  }

  @override
  Future<Client?> deleteClient(Client client) async {
    try {
      final clientResponse =
          await clientsTable.delete().eq('id', client.id!).select();
      return Client.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error deleting client: $e');
    }
  }

  @override
  Future<List<Client>> getClients() async {
    try {
      final clientResponse = await clientsTable.select();
      return clientResponse.map((e) => Client.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error getting clients: $e');
    }
  }

  @override
  Future<List<Client>> searchClients(String query) async {
    try {
      final clientResponse = await clientsTable.select().or(
        'name.ilike.%$query%,phone.ilike.%$query%',
      );
      return clientResponse.map((e) => Client.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error searching clients: $e');
    }
  }

  @override
  Future<Client?> updateClient(Client client) async {
    try {
      final clientResponse =
          await clientsTable
              .update(client.toMap())
              .eq('id', client.id!)
              .select();
      return Client.fromMap(clientResponse.first);
    } catch (e) {
      throw Exception('Error updating client: $e');
    }
  }

  @override
  Future<bool> clientPhoneExists(String phone) async {
    try {
      final clientResponse = await clientsTable.select().eq('phone', phone);
      return clientResponse.isNotEmpty;
    } catch (e) {
      throw Exception('Error checking client phone: $e');
    }
  }
}
