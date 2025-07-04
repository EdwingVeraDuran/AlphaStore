import 'package:alpha_store/core/layout/widgets/sheet_layout.dart';
import 'package:alpha_store/features/customers/domain/entities/customer.dart';
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

  void createCustomer() async {
    //TODO: Add validation

    final customer = Customer(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      hood: _hoodController.text,
    );
    context.read<CustomerBloc>().add(AddCustomer(customer));
    closeSheet(context);
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
