import 'package:ams_android/bloc_architecture/base_view.dart';
import 'package:ams_android/core/navigation/navigation_handler.dart';
import 'package:ams_android/features/ams_app/cubit/ams_app_state.dart';
import 'package:ams_android/features/ams_app/cubit/ams_app_view_model.dart';
import 'package:ams_android/utils/snack_bar_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmsApp extends StatelessWidget {
  const AmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).orientation == Orientation.landscape
          ? const Size(844, 390)
          : const Size(390, 844),
      minTextAdapt: false,
      ensureScreenSize: true,
      child: BaseView<AmsAppViewModel, AmsAppState>(
        onViewModelReady: (viewModel) {
          viewModel.initThemeMode();
        },
        stateListener: (context, state) {
          // if(state.clockSkewDetected) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) => )
          // }
        },
        builder: (context, viewModel, state) => MaterialApp.router(
          scaffoldMessengerKey: SnackBarUtil.scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          routerDelegate: NavigationHandler.instance.routerDelegate,
          routeInformationParser: NavigationHandler.instance.routeInformationParser,
          builder: (context, child) => getFixedFontAmsBuilder(context, child),
        ),
      ),
    );
  }

  MediaQuery getFixedFontAmsBuilder(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: child!,
    );
  }
}
