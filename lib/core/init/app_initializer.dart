import 'dart:async';

import 'package:ams_android/base/app_bloc_observer.dart';
import 'package:ams_android/core/di/injection.dart';

import 'package:ams_android/ams_app.dart';
import 'package:ams_android/core/logger/ams_logger.dart';
import 'package:ams_android/core/navigation/navigation_handler.dart';
import 'package:ams_android/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        NavigationHandler.initialize(AppRouter());
        await configureDependencies();
        runStateObserver(); // Bloc observer
        runApp(const AmsApp());
      },
      (error, stack) {
        Log.e('App level error', error: error, stackTrace: stack);
      },
    );
  }
}
