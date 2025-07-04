import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';

sealed class ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

class ToggleAppModeEvent extends ThemeEvent {}

class SetAppColorEvent extends ThemeEvent {
  final AppColor appColor;
  SetAppColorEvent(this.appColor);
}

class SetAppScaleEvent extends ThemeEvent {
  final double scaleFactor;
  SetAppScaleEvent(this.scaleFactor);
}
