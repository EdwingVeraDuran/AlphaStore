import 'package:alpha_store/core/theme/data/app_colors.dart';
import 'package:alpha_store/core/theme/data/app_mode.dart';
import 'package:alpha_store/core/theme/presentation/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(ThemeState(mode: AppMode.light, appColor: AppColor.blue));

  void toggleAppMode() {
    emit(
      state.copyWith(
        mode: state.mode == AppMode.dark ? AppMode.light : AppMode.dark,
      ),
    );
  }

  void setColor(AppColor color) {
    emit(state.copyWith(appColor: color));
  }
}
