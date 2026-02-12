import 'package:copy_with_extension/copy_with_extension.dart';

part 'login_state.g.dart';

enum LoginStatus{ initial, loading, success, failure }

@CopyWith()
class LoginState {
  final LoginStatus status;
  final String? errorMessage;
  final String? accessToken;
  final String? refreshToken;

  const LoginState({this.status = LoginStatus.initial, this.errorMessage, this.accessToken, this.refreshToken});
}