import 'package:alpha_store/core/layout/pages/layout_page.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_state.dart';
import 'package:alpha_store/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return LayoutPage();
        }
        if (state is Unauthenticated) {
          return AuthPage();
        } else {
          return const Scaffold(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
