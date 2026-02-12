import 'package:ams_android/core/logger/ams_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.e('${bloc.runtimeType} error: $error');
  }
}

void runStateObserver() {
  Bloc.observer = AppBlocObserver();
}
