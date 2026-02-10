import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'ams_app_state.g.dart';

@CopyWith()
class AmsAppState {
  ThemeMode? themeMode;
  bool clockSkewDetected;

  AmsAppState({this.themeMode, this.clockSkewDetected = false});
}
