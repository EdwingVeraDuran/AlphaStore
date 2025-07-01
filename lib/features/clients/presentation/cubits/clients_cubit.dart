import 'package:alpha_store/features/clients/domain/entities/client.dart';
import 'package:alpha_store/features/clients/domain/repos/clients_repo.dart';
import 'package:alpha_store/features/clients/presentation/cubits/clients_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsCubit extends Cubit<ClientsState> {
  final ClientsRepo clientsRepo;

  ClientsCubit({required this.clientsRepo}) : super(ClientsInitial());

  Future<void> createClient(Client client) async {
    try {
      final clientResponse = await clientsRepo.createClient(client);

      if (clientResponse != null) {
        emit(ClientCreated(clientResponse));
      }
    } catch (e) {
      emit(ClientsError('Error creating client: $e'));
    }
  }

  Future<void> deleteClient(Client client) async {
    try {
      final clientResponse = await clientsRepo.deleteClient(client);

      if (clientResponse != null) {
        emit(ClientDeleted(clientResponse));
      }
    } catch (e) {
      emit(ClientsError('Error deleting client: $e'));
    }
  }

  Future<void> updateClient(Client client) async {
    try {
      final clientResponse = await clientsRepo.updateClient(client);

      if (clientResponse != null) {
        emit(ClientUpdated(clientResponse));
      }
    } catch (e) {
      emit(ClientsError('Error updating client: $e'));
    }
  }

  Future<void> readClients() async {
    emit(ClientsLoading());
    try {
      final clientResponse = await clientsRepo.getClients();
      clientResponse.isNotEmpty
          ? emit(ClientsList(clientResponse))
          : emit(ClientsEmpty());
    } catch (e) {
      emit(ClientsError(e.toString()));
    }
  }

  Future<void> searchClients(String query) async {
    emit(ClientsLoading());
    try {
      final clientResponse = await clientsRepo.searchClients(query);
      clientResponse.isNotEmpty
          ? emit(ClientsList(clientResponse))
          : emit(ClientsEmpty());
    } catch (e) {
      emit(ClientsError(e.toString()));
    }
  }
}
