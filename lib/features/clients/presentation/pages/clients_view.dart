import 'package:alpha_store/core/layout/widgets/view_layout.dart';
import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:alpha_store/core/shared/widgets/search_field.dart';
import 'package:alpha_store/features/clients/presentation/cubits/clients_cubit.dart';
import 'package:alpha_store/features/clients/presentation/cubits/clients_state.dart';
import 'package:alpha_store/features/clients/presentation/dialogs/create_client_sheet.dart';
import 'package:alpha_store/features/clients/presentation/widgets/clients_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  @override
  void initState() {
    super.initState();
    context.read<ClientsCubit>().readClients();
  }

  @override
  Widget build(BuildContext context) {
    return ViewLayout(
      view: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(),
              ActionButton(
                label: 'Crear cliente',
                icon: LucideIcons.circlePlus,
                onPressed:
                    () => openSheet(
                      context: context,
                      builder: (context) => CreateClientSheet(),
                      position: OverlayPosition.right,
                    ).then((value) => print(value)),
              ),
            ],
          ),
          Gap(24),
          BlocBuilder<ClientsCubit, ClientsState>(
            builder: (context, state) {
              if (state is ClientsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ClientsList) {
                return ClientsTable(state.clients);
              }
              if (state is ClientsEmpty) {
                return Center(child: Text('No hay clientes'));
              }
              if (state is ClientsError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
