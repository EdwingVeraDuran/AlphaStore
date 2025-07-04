import 'package:alpha_store/core/theme/data/shared_preferences_theme_repo.dart';
import 'package:alpha_store/core/theme/domain/repos/theme_repo.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:alpha_store/features/auth/data/supabase_auth_repo.dart';
import 'package:alpha_store/features/auth/domain/repos/auth_repo.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/customers/data/supabase_customer_repo.dart';
import 'package:alpha_store/features/customers/domain/repos/customer_repo.dart';
import 'package:alpha_store/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:alpha_store/features/categories/data/supabase_categories_repo.dart';
import 'package:alpha_store/features/stock_entry/data/supabase_orders_repo.dart';
import 'package:alpha_store/features/products/data/supabase_products_repo.dart';
import 'package:alpha_store/features/categories/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/stock_entry/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:alpha_store/features/stock_entry/presentation/bloc/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Repositories
  getIt.registerLazySingleton<ThemeRepo>(() => SharedPreferencesThemeRepo());
  getIt.registerLazySingleton<AuthRepo>(() => SupabaseAuthRepo());
  getIt.registerLazySingleton<ProductsRepo>(() => SupabaseProductsRepo());
  getIt.registerLazySingleton<CategoriesRepo>(() => SupabaseCategoriesRepo());
  getIt.registerLazySingleton<OrdersRepo>(() => SupabaseOrdersRepo());
  getIt.registerLazySingleton<CustomerRepo>(() => SupabaseCustomerRepo());

  // Cubits
  getIt.registerFactory(() => ThemeBloc(getIt<ThemeRepo>()));
  getIt.registerFactory(() => AuthCubit(authRepo: getIt<AuthRepo>()));
  getIt.registerFactory(
    () => ProductsCubit(productsRepo: getIt<ProductsRepo>()),
  );
  getIt.registerFactory(
    () => CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>()),
  );
  getIt.registerFactory(() => OrdersCubit(ordersRepo: getIt<OrdersRepo>()));
  getIt.registerFactory(() => CustomerBloc(getIt<CustomerRepo>()));
}
