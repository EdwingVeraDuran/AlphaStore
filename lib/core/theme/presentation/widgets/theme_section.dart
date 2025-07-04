import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:alpha_store/core/theme/domain/entities/app_mode.dart';
import 'package:alpha_store/core/theme/domain/entities/theme_color.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_event.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_state.dart';
import 'package:alpha_store/core/theme/presentation/widgets/color_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ThemeSection extends StatelessWidget {
  ThemeSection({super.key});

  final List<ThemeColor> themeColors = [
    ThemeColor(appColor: AppColor.blue, color: Colors.blue),
    ThemeColor(appColor: AppColor.gray, color: Colors.gray),
    ThemeColor(appColor: AppColor.green, color: Colors.green),
    ThemeColor(appColor: AppColor.neutral, color: Colors.neutral),
    ThemeColor(appColor: AppColor.orange, color: Colors.orange),
    ThemeColor(appColor: AppColor.red, color: Colors.red),
    ThemeColor(appColor: AppColor.rose, color: Colors.pink),
    ThemeColor(appColor: AppColor.slate, color: Colors.slate),
    ThemeColor(appColor: AppColor.stone, color: Colors.stone),
    ThemeColor(appColor: AppColor.violet, color: Colors.purple),
    ThemeColor(appColor: AppColor.yellow, color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Slider(
                    value: SliderValue.single(state.appScale.value),
                    min: 0.5,
                    max: 1.5,
                    divisions: 10,
                    onChanged:
                        (value) => context.read<ThemeBloc>().add(
                          SetAppScaleEvent(value.value),
                        ),
                  ),
                ),
                Switch(
                  leading: Icon(LucideIcons.sun),
                  trailing: Icon(LucideIcons.moon),
                  value: state.mode == AppMode.dark,
                  onChanged:
                      (value) =>
                          context.read<ThemeBloc>().add(ToggleAppModeEvent()),
                ),
              ],
            ),
            Gap(16),
            RadioGroup(
              value: state.appColor,
              onChanged:
                  (value) =>
                      context.read<ThemeBloc>().add(SetAppColorEvent(value)),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children:
                    themeColors
                        .map(
                          (e) =>
                              ColorCard(color: e.color, appColor: e.appColor),
                        )
                        .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
