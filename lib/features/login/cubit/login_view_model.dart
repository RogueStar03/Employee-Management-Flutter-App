import 'package:ams_android/base/base_cubit.dart';
import 'package:ams_android/features/login/cubit/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(const LoginState());

  void login() {
    emit(state.copyWith(status: LoginStatus.success));
  }
}
