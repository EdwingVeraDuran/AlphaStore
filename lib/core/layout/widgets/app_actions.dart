import 'package:alpha_store/core/layout/dialogs/settings_dialog.dart';
import 'package:alpha_store/core/layout/widgets/sidebar_tile.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AppActions extends StatelessWidget {
  const AppActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SidebarTile(
          icon: LucideIcons.settings,
          label: 'Configuración',
          onPressed:
              () => showDialog(
                context: context,
                builder: (context) => SettingsDialog(),
              ),
        ),
        SidebarTile(
          icon: LucideIcons.logOut,
          label: 'Cerrar sesión',
          onPressed: () => context.read<AuthCubit>().logout(),
        ),
      ],
    );
  }
}
