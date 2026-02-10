import 'package:ams_android/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: "Routes")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => getAppRoutes();
}

List<AutoRoute> getAppRoutes() {
  return [AutoRoute(page: LoginScreenRoute.page, initial: true)];
}
