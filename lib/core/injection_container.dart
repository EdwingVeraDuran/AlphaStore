import 'package:alpha_store/features/auth/data/supabase_auth_repo.dart';
import 'package:alpha_store/features/auth/domain/repos/auth_repo.dart';
import 'package:alpha_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alpha_store/features/products/data/supabase_categories_repo.dart';
import 'package:alpha_store/features/products/data/supabase_products_repo.dart';
import 'package:alpha_store/features/products/domain/repos/categories_repo.dart';
import 'package:alpha_store/features/products/domain/repos/products_repo.dart';
import 'package:alpha_store/features/products/presentation/cubit/categories_cubit.dart';
import 'package:alpha_store/features/products/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Respositories
  getIt.registerLazySingleton<AuthRepo>(() => SupabaseAuthRepo());
  getIt.registerLazySingleton<ProductsRepo>(() => SupabaseProductsRepo());
  getIt.registerLazySingleton<CategoriesRepo>(() => SupabaseCategoriesRepo());

  // Cubits
  getIt.registerFactory(() => AuthCubit(authRepo: getIt<SupabaseAuthRepo>()));
  getIt.registerFactory(
    () => ProductsCubit(productsRepo: getIt<SupabaseProductsRepo>()),
  );
  getIt.registerFactory(
    () => CategoriesCubit(productsRepo: getIt<SupabaseCategoriesRepo>()),
  );
}
