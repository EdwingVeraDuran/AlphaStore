import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:alpha_store/core/theme/domain/entities/app_mode.dart';
import 'package:alpha_store/core/theme/domain/repos/theme_repo.dart';
import 'package:alpha_store/core/theme/presentation/cubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesThemeRepo implements ThemeRepo {
  static const _modeKey = 'theme_mode';
  static const _colorKey = 'theme_color';

  @override
  Future<ThemeState> getTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final modeName = prefs.getString(_modeKey);
      final colorName = prefs.getString(_colorKey);

      final appMode = AppMode.values.firstWhere(
        (element) => element.name == modeName,
        orElse: () => AppMode.light,
      );
      final appColor = AppColor.values.firstWhere(
        (element) => element.name == colorName,
        orElse: () => AppColor.blue,
      );

      return ThemeState(mode: appMode, appColor: appColor);
    } catch (e) {
      throw Exception('Error getting theme from shared preferences: $e');
    }
  }

  @override
  Future<void> saveTheme(ThemeState state) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(_modeKey, state.mode.name);
      await prefs.setString(_colorKey, state.appColor.name);
    } catch (e) {
      throw Exception('Error saving theme to shared preferences: $e');
    }
  }
}
