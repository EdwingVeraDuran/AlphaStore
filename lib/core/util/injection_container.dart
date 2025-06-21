import 'package:alpha_store/features/auth/data/supabase_auth_repo.dart';
import 'package:alpha_store/features/auth/domain/repos/auth_repo.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/products/data/supabase_categories_repo.dart';
import 'package:alpha_store/features/products/data/supabase_orders_repo.dart';
import 'package:alpha_store/features/products/data/supabase_products_repo.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/domain/repos/orders_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/orders/orders_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Respositories
  getIt.registerLazySingleton<AuthRepo>(() => SupabaseAuthRepo());
  getIt.registerLazySingleton<ProductsRepo>(() => SupabaseProductsRepo());
  getIt.registerLazySingleton<CategoriesRepo>(() => SupabaseCategoriesRepo());
  getIt.registerLazySingleton<OrdersRepo>(() => SupabaseOrdersRepo());

  // Cubits
  getIt.registerFactory(() => AuthCubit(authRepo: getIt<AuthRepo>()));
  getIt.registerFactory(
    () => ProductsCubit(productsRepo: getIt<ProductsRepo>()),
  );
  getIt.registerFactory(
    () => CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>()),
  );
  getIt.registerFactory(() => OrdersCubit(ordersRepo: getIt<OrdersRepo>()));
}
