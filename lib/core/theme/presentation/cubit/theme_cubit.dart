import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:alpha_store/core/theme/domain/entities/app_mode.dart';
import 'package:alpha_store/core/theme/domain/repos/theme_repo.dart';
import 'package:alpha_store/core/theme/presentation/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepo themeRepo;

  ThemeCubit({required this.themeRepo})
    : super(ThemeState(mode: AppMode.light, appColor: AppColor.blue));

  Future<void> loadTheme() async {
    try {
      final appTheme = await themeRepo.getTheme();
      emit(appTheme);
    } catch (e) {
      throw Exception('Error loading theme: $e');
    }
  }

  void toggleAppMode() async {
    try {
      emit(
        state.copyWith(
          mode: state.mode == AppMode.dark ? AppMode.light : AppMode.dark,
        ),
      );
      await themeRepo.saveTheme(state);
    } catch (e) {
      throw Exception('Error toggling app mode: $e');
    }
  }

  void setColor(AppColor color) async {
    try {
      emit(state.copyWith(appColor: color));
      await themeRepo.saveTheme(state);
    } catch (e) {
      throw Exception('Error setting app color: $e');
    }
  }
}
