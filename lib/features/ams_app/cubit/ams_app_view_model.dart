import 'package:ams_android/base/base_cubit.dart';
import 'package:ams_android/core/logger/ams_logger.dart';
import 'package:ams_android/di/injector.dart';
import 'package:ams_android/features/ams_app/cubit/ams_app_state.dart';
import 'package:ams_android/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AmsAppViewModel extends BaseCubit<AmsAppState> {
  AmsAppViewModel() : super(AmsAppState());

  Future<void> initThemeMode() async {
    String? themeMode = await inject<AmsSecureStorage>().getActiveTheme();
    if (themeMode == null) {
      emit(state.copyWith(themeMode: ThemeMode.system));
    }
    switch (themeMode) {
      case "li":
        emit(state.copyWith(themeMode: ThemeMode.light));
        break;
      case "da":
        emit(state.copyWith(themeMode: ThemeMode.dark));
        break;
      case "sy":
        emit(state.copyWith(themeMode: ThemeMode.system));
        break;
    }
  }

  void clockSkewDetected() {
    Log.e('Clock Skew Detected');
    emit(state.copyWith(clockSkewDetected: true));
  }
}
