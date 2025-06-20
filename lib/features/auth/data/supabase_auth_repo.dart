import 'package:alpha_store/features/auth/domain/entities/app_user.dart';
import 'package:alpha_store/features/auth/domain/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepo implements AuthRepo {
  final supabaseAuth = Supabase.instance.client.auth;

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final supabaseUser = supabaseAuth.currentUser;

      if (supabaseUser == null) return null;

      return AppUser(uid: supabaseUser.id, email: supabaseUser.email!);
    } catch (e) {
      throw Exception('Error al obtener el usuario: $e');
    }
  }

  @override
  Future<AppUser?> login(String email, String password) async {
    try {
      final AuthResponse authResponse = await supabaseAuth.signInWithPassword(
        email: email,
        password: password,
      );

      return AppUser(
        uid: authResponse.user!.id,
        email: authResponse.user!.email!,
      );
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabaseAuth.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }
}
