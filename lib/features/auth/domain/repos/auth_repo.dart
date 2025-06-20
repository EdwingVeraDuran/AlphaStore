import 'package:alpha_store/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> login(String email, String password);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
