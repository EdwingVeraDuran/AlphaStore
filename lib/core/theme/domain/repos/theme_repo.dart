import 'package:alpha_store/core/theme/presentation/cubit/theme_state.dart';

abstract class ThemeRepo {
  Future<void> saveTheme(ThemeState state);
  Future<ThemeState> getTheme();
}
