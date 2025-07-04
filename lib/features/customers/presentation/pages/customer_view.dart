import 'package:alpha_store/core/layout/widgets/view_layout.dart';
import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:alpha_store/core/shared/widgets/operation_toast.dart';
import 'package:alpha_store/core/shared/widgets/search_field.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_event.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_state.dart';
import 'package:alpha_store/features/customers/presentation/dialogs/create_customer_sheet.dart';
import 'package:alpha_store/features/customers/presentation/widgets/customer_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(LoadCustomers());
  }

  @override
  Widget build(BuildContext context) {
    return ViewLayout(
      view: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(
                placeholder: 'Buscar cliente',
                onChanged:
                    (query) =>
                        query.isEmpty
                            ? context.read<CustomerBloc>().add(LoadCustomers())
                            : context.read<CustomerBloc>().add(
                              SearchCustomer(query),
                            ),
              ),
              ActionButton(
                label: 'Crear cliente',
                icon: LucideIcons.circlePlus,
                onPressed:
                    () => openSheet(
                      context: context,
                      builder: (context) => CreateCustomerSheet(),
                      position: OverlayPosition.right,
                    ),
              ),
            ],
          ),
          Gap(24),
          BlocConsumer<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state is CustomerLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CustomerEmpty) {
                return Center(child: Text('No hay clientes'));
              }
              if (state is CustomerLoaded) {
                return CustomerTable(state.customers);
              }

              return Center(
                child: IconButton.outline(icon: Icon(LucideIcons.refreshCcw)),
              );
            },
            listener: (context, state) {
              if (state is CustomerFeedbackState) {
                showToast(
                  context: context,
                  builder:
                      (context, overlay) => OperationToast(
                        overlay: overlay,
                        status: state.status,
                      ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
