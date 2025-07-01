import 'package:alpha_store/features/clients/domain/entities/client.dart';

abstract class ClientsRepo {
  Future<Client?> createClient(Client client);
  Future<Client?> deleteClient(Client client);
  Future<Client?> updateClient(Client client);
  Future<List<Client>> getClients();
  Future<List<Client>> searchClients(String query);
  Future<bool> clientPhoneExists(String phone);
}
