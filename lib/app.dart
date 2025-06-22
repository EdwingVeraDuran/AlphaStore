import 'package:alpha_store/core/theme/presentation/cubit/theme_cubit.dart';
import 'package:alpha_store/core/theme/presentation/cubit/theme_state.dart';
import 'package:alpha_store/core/util/injection_container.dart';
import 'package:alpha_store/core/layout/pages/layout_page.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_state.dart';
import 'package:alpha_store/features/auth/presentation/pages/auth_page.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt<ProductsRepo>()),
        RepositoryProvider(create: (context) => getIt<CategoriesRepo>()),
        RepositoryProvider(create: (context) => getIt<OrdersRepo>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ThemeCubit>()..loadTheme()),
          BlocProvider(create: (context) => getIt<AuthCubit>()..checkAuth()),
          BlocProvider(create: (context) => getIt<ProductsCubit>()),
          BlocProvider(create: (context) => getIt<CategoriesCubit>()),
          BlocProvider(create: (context) => getIt<OrdersCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return ShadcnApp(
              title: 'Alpha Store',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(colorScheme: state.colorScheme, radius: 1),
              home: BlocBuilder<AuthCubit, AuthState>(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
