import 'package:alpha_store/core/util/injection_container.dart';
import 'package:alpha_store/core/layout/pages/layout_page.dart';
import 'package:alpha_store/features/auth/domain/repos/auth_repo.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_state.dart';
import 'package:alpha_store/features/auth/presentation/pages/auth_page.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_cubit.dart';
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
          BlocProvider(
            create:
                (context) =>
                    AuthCubit(authRepo: getIt<AuthRepo>())..checkAuth(),
          ),
          BlocProvider(
            create:
                (context) => ProductsCubit(productsRepo: getIt<ProductsRepo>()),
          ),
          BlocProvider(
            create:
                (context) =>
                    CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>()),
          ),
          BlocProvider(
            create: (context) => OrdersCubit(ordersRepo: getIt<OrdersRepo>()),
          ),
        ],
        child: ShadcnApp(
          title: 'Alpha Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorSchemes.darkNeutral(), radius: 1),
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
        ),
      ),
    );
  }
}
