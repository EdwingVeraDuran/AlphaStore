import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:alpha_store/core/theme/domain/entities/app_mode.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ThemeState {
  final AppMode mode;
  final AppColor appColor;
  final SliderValue appScale;

  ThemeState({
    required this.mode,
    required this.appColor,
    required this.appScale,
  });

  ThemeState copyWith({
    AppMode? mode,
    AppColor? appColor,
    SliderValue? appScale,
  }) {
    return ThemeState(
      mode: mode ?? this.mode,
      appColor: appColor ?? this.appColor,
      appScale: appScale ?? this.appScale,
    );
  }

  ColorScheme get colorScheme {
    switch (appColor) {
      case AppColor.blue:
        return mode == AppMode.dark
            ? ColorSchemes.darkBlue()
            : ColorSchemes.lightBlue();
      case AppColor.gray:
        return mode == AppMode.dark
            ? ColorSchemes.darkGray()
            : ColorSchemes.lightGray();
      case AppColor.green:
        return mode == AppMode.dark
            ? ColorSchemes.darkGreen()
            : ColorSchemes.lightGreen();
      case AppColor.neutral:
        return mode == AppMode.dark
            ? ColorSchemes.darkNeutral()
            : ColorSchemes.lightNeutral();
      case AppColor.orange:
        return mode == AppMode.dark
            ? ColorSchemes.darkOrange()
            : ColorSchemes.lightOrange();
      case AppColor.red:
        return mode == AppMode.dark
            ? ColorSchemes.darkRed()
            : ColorSchemes.lightRed();
      case AppColor.rose:
        return mode == AppMode.dark
            ? ColorSchemes.darkRose()
            : ColorSchemes.lightRose();
      case AppColor.slate:
        return mode == AppMode.dark
            ? ColorSchemes.darkSlate()
            : ColorSchemes.lightSlate();
      case AppColor.stone:
        return mode == AppMode.dark
            ? ColorSchemes.darkStone()
            : ColorSchemes.lightStone();
      case AppColor.violet:
        return mode == AppMode.dark
            ? ColorSchemes.darkViolet()
            : ColorSchemes.lightViolet();
      case AppColor.yellow:
        return mode == AppMode.dark
            ? ColorSchemes.darkYellow()
            : ColorSchemes.lightYellow();
      case AppColor.zinc:
        return mode == AppMode.dark
            ? ColorSchemes.darkZinc()
            : ColorSchemes.lightZinc();
    }
  }
}
