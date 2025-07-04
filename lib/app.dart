import 'package:alpha_store/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_event.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_state.dart';
import 'package:alpha_store/core/util/injection_container.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/customers/domain/repos/customer_repo.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:alpha_store/features/categories/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/stock_entry/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:alpha_store/features/stock_entry/presentation/bloc/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_cubit.dart';
import 'package:alpha_store/home_page.dart';
import 'package:alpha_store/splash_screen.dart';
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
        RepositoryProvider(create: (context) => getIt<CustomerRepo>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ThemeBloc>()..add(LoadThemeEvent()),
          ),
          BlocProvider(create: (context) => getIt<AuthCubit>()..checkAuth()),
          BlocProvider(create: (context) => getIt<ProductsCubit>()),
          BlocProvider(create: (context) => getIt<CategoriesBloc>()),
          BlocProvider(create: (context) => getIt<OrdersCubit>()),
          BlocProvider(create: (context) => getIt<CustomerBloc>()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ShadcnApp(
              title: 'Alpha Store',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: state.colorScheme,
                radius: 1,
                scaling: state.appScale.value,
              ),
              initialRoute: '/',
              routes: {'/': (_) => SplashScreen(), '/home': (_) => HomePage()},
            );
          },
        ),
      ),
    );
  }
}
