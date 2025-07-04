import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    context.read<AuthCubit>().login(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Icon(LucideIcons.store, size: 24),
              ),
              Gap(16),
              Text('Alpha Store').medium.xLarge,
            ],
          ),
          Gap(32),
          Card(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Bienvenido').x2Large.bold,
                  const Text(
                    'Inicia sesión en tu cuenta Alpha',
                  ).muted.foreground,
                  Gap(32),
                  Divider(),
                  Gap(32),
                  TextField(
                    placeholder: const Text('Correo electrónico'),
                    features: [InputFeature.clear()],
                    controller: _emailController,
                  ),
                  Gap(32),
                  TextField(
                    placeholder: const Text('Contraseña'),
                    features: [InputFeature.passwordToggle()],
                    controller: _passwordController,
                    onSubmitted: (_) => login(),
                  ),
                  Gap(32),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: login,
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
