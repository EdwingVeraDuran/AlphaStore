import 'package:alpha_store/core/layout/widgets/sheet_layout.dart';
import 'package:alpha_store/core/shared/entities/form_error.dart';
import 'package:alpha_store/core/shared/widgets/error_toast.dart';
import 'package:alpha_store/core/util/toast_utils.dart';
import 'package:alpha_store/features/customers/domain/entities/customer.dart';
import 'package:alpha_store/features/customers/domain/repos/customer_repo.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateCustomerSheet extends StatefulWidget {
  const CreateCustomerSheet({super.key});

  @override
  State<CreateCustomerSheet> createState() => _CreateCustomerSheetState();
}

class _CreateCustomerSheetState extends State<CreateCustomerSheet> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _hoodController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _hoodController.dispose();
    super.dispose();
  }

  void createCustomer() async {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;
    final hood = _hoodController.text;

    FormError? error;

    if (name.isEmpty) {
      error = FormError.emptyField('Nombre');
    } else if (phone.isEmpty) {
      error = FormError.emptyField('Teléfono');
    } else if (address.isEmpty) {
      error = FormError.emptyField('Dirección');
    } else if (hood.isEmpty) {
      error = FormError.emptyField('Barrio');
    } else if (name.length < 3) {
      error = FormError.minLength('Nombre', 3);
    } else if (phone.length < 10) {
      error = FormError.minLength('Teléfono', 10);
    } else if (phone.length > 10) {
      error = FormError.maxLength('Teléfono', 10);
    } else if (address.length < 5) {
      error = FormError.minLength('Dirección', 5);
    } else if (hood.length < 3) {
      error = FormError.minLength('Barrio', 3);
    } else if (await context.read<CustomerRepo>().customerPhoneExists(phone)) {
      error = FormError.custom('El número de teléfono ya existe.');
    }

    if (error != null) {
      if (!mounted) return;
      safeShowToast(
        context,
        builder:
            (context, overlay) => ErrorToast(overlay: overlay, status: error!),
      );
      return;
    }

    final customer = Customer(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      hood: _hoodController.text,
    );

    if (!mounted) return;

    closeSheet(context);
    context.read<CustomerBloc>().add(AddCustomer(customer));
  }

  @override
  Widget build(BuildContext context) {
    return SheetLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Crear cliente').large().medium(),
          Gap(16),
          TextField(controller: _nameController, placeholder: Text('Nombre')),
          Gap(16),
          TextField(
            controller: _phoneController,
            placeholder: Text('Teléfono'),
          ),
          Gap(16),
          TextField(
            controller: _addressController,
            placeholder: Text('Dirección'),
          ),
          Gap(16),
          TextField(controller: _hoodController, placeholder: Text('Barrio')),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlineButton(
                onPressed: () => closeSheet(context),
                child: Text('Cancelar'),
              ),
              Gap(16),
              PrimaryButton(onPressed: createCustomer, child: Text('Crear')),
            ],
          ),
        ],
      ),
    );
  }
}
