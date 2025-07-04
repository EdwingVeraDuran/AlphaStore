import 'package:alpha_store/core/shared/entities/operation_status.dart';
import 'package:alpha_store/core/util/app_logger.dart';
import 'package:alpha_store/features/customers/domain/repos/customer_repo.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_event.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepo customerRepo;

  CustomerBloc(this.customerRepo) : super(CustomerInitial()) {
    on<LoadCustomers>(_onLoadCustomers);
    on<AddCustomer>(_onAddCustomer);
    on<UpdateCustomer>(_onUpdateCustomer);
    on<DeleteCustomer>(_onDeleteCustomer);
    on<SearchCustomer>(_onSearchCustomer);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    AppLogger().error('CustomerBloc Error', error, stackTrace);
    super.onError(error, stackTrace);
  }

  Future<void> _onLoadCustomers(
    LoadCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(CustomerLoading());

      final response = await customerRepo.getCustomers();

      response.isEmpty ? emit(CustomerEmpty()) : emit(CustomerLoaded(response));
    } catch (e) {
      addError(CustomerError(e.toString()));
    }
  }

  Future<void> _onAddCustomer(
    AddCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      final response = await customerRepo.addCustomer(event.customer);

      if (response == null) {
        emit(
          CustomerFeedbackState(
            OperationStatus.errorAdd(
              'No se ha podido crear el cliente con teléfono: ${event.customer.phone}',
            ),
          ),
        );
      } else {
        emit(
          CustomerFeedbackState(
            OperationStatus.succesAdd('Se ha creado con exito el cliente.'),
          ),
        );
        add(LoadCustomers());
      }
    } catch (e) {
      addError(CustomerError(e.toString()));
    }
  }

  Future<void> _onUpdateCustomer(
    UpdateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      final response = await customerRepo.updateCustomer(event.customer);

      if (response == null) {
        emit(
          CustomerFeedbackState(
            OperationStatus.errorUpdate(
              'No se ha podido actualizar el cliente con id: ${event.customer.id}',
            ),
          ),
        );
      } else {
        emit(
          CustomerFeedbackState(
            OperationStatus.succesAdd(
              'Se ha actualizado con exito el cliente.',
            ),
          ),
        );
        add(LoadCustomers());
      }
    } catch (e) {
      addError(CustomerError(e.toString()));
    }
  }

  Future<void> _onDeleteCustomer(
    DeleteCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      final response = await customerRepo.deleteCustomer(event.customer);

      if (response == null) {
        emit(
          CustomerFeedbackState(
            OperationStatus.errorUpdate(
              'No se ha podido eliminar el cliente con id: ${event.customer.id}',
            ),
          ),
        );
      } else {
        emit(
          CustomerFeedbackState(
            OperationStatus.succesAdd('Se ha eliminado con exito el cliente.'),
          ),
        );
        add(LoadCustomers());
      }
    } catch (e) {
      addError(CustomerError(e.toString()));
    }
  }

  Future<void> _onSearchCustomer(
    SearchCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      final response = await customerRepo.searchCustomers(event.query);

      response.isEmpty ? emit(CustomerEmpty()) : emit(CustomerLoaded(response));
    } catch (e) {
      addError(CustomerError(e.toString()));
    }
  }
}
