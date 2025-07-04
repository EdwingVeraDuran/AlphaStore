import 'package:alpha_store/core/theme/domain/entities/app_colors.dart';
import 'package:alpha_store/core/theme/domain/entities/app_mode.dart';
import 'package:alpha_store/core/theme/domain/repos/theme_repo.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_event.dart';
import 'package:alpha_store/core/theme/presentation/bloc/theme_state.dart';
import 'package:alpha_store/core/util/app_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepo themeRepo;

  ThemeBloc(this.themeRepo)
    : super(
        ThemeState(
          mode: AppMode.light,
          appColor: AppColor.blue,
          appScale: SliderValue.single(1),
        ),
      ) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ToggleAppModeEvent>(_onToggleAppMode);
    on<SetAppColorEvent>(_onSetAppColor);
    on<SetAppScaleEvent>(_onSetAppScale);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    AppLogger().error('ThemeBloc Error', error, stackTrace);
    super.onError(error, stackTrace);
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final appTheme = await themeRepo.getTheme();
      emit(appTheme);
    } catch (e) {
      addError(e);
    }
  }

  Future<void> _onToggleAppMode(
    ToggleAppModeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final updated = state.copyWith(
        mode: state.mode == AppMode.dark ? AppMode.light : AppMode.dark,
      );
      emit(updated);
      await themeRepo.saveTheme(updated);
    } catch (e) {
      addError(e);
    }
  }

  void _onSetAppColor(SetAppColorEvent event, Emitter<ThemeState> emit) async {
    try {
      final updated = state.copyWith(appColor: event.appColor);
      emit(updated);
      await themeRepo.saveTheme(updated);
    } catch (e) {
      addError(e);
    }
  }

  void _onSetAppScale(SetAppScaleEvent event, Emitter<ThemeState> emit) async {
    try {
      final updated = state.copyWith(
        appScale: SliderValue.single(event.scaleFactor),
      );
      emit(updated);
      await themeRepo.saveTheme(state);
    } catch (e) {
      addError(e);
    }
  }
}
