import 'package:alpha_store/core/layout/widgets/sheet_layout.dart';
import 'package:alpha_store/features/clients/domain/entities/client.dart';
import 'package:alpha_store/features/clients/presentation/cubits/clients_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CreateClientSheet extends StatefulWidget {
  const CreateClientSheet({super.key});

  @override
  State<CreateClientSheet> createState() => _CreateClientSheetState();
}

class _CreateClientSheetState extends State<CreateClientSheet> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _hoodController = TextEditingController();

  void createClient() async {
    final client = Client(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      hood: _hoodController.text,
    );
    final response = await context.read<ClientsCubit>().createClient(client);
  }

  @override
  Widget build(BuildContext context) {
    return SheetLayout(
      child: Column(
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
              PrimaryButton(onPressed: createClient, child: Text('Crear')),
            ],
          ),
        ],
      ),
    );
  }
}
