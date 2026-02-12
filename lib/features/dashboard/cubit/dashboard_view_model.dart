import 'package:ams_android/base/base_cubit.dart';
import 'package:ams_android/features/dashboard/cubit/dashboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardViewModel extends BaseCubit<DashboardState>{
  DashboardViewModel() : super(DashboardState());
}