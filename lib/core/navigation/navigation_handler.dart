import 'package:ams_android/core/logger/ams_logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static NavigationHandler? _instance;
  final RootStackRouter _router;
  final PageRouteInfo? _homeRoute;

  NavigationHandler._internal(this._router, this._homeRoute);

  /// Call this once during app startup
  static void initialize(RootStackRouter router, {PageRouteInfo? homeRoute}) {
    Log.i('Initializing NavigationHandler');
    _instance ??= NavigationHandler._internal(router, homeRoute);
  }

  /// Use this getter throughout the app
  static NavigationHandler get instance {
    if (_instance == null) {
      throw Exception('NavigationHandler not initialized. Call initialize() first.');
    }
    return _instance!;
  }

  RootStackRouter get router => _router;

  RouteInformationParser<Object> get routeInformationParser => _router.defaultRouteParser();

  RouterDelegate<Object> get routerDelegate => _router.delegate();

  Future<T?> navigateTo<T>(
      PageRouteInfo route, {
        NavigationType navigationType = NavigationType.push,
      }) async {
    try {
      switch (navigationType) {
        case NavigationType.push:
          return _router.push<T>(route);
        case NavigationType.pushReplacement:
          return _router.replace(route);
        case NavigationType.popUntil:
          _router.popUntilRouteWithName(route.routeName);
          return Future.value(null);
        case NavigationType.pushAndPopUntil:
          await _router.replaceAll([route]);
          return Future.value(null);
        case NavigationType.clearPush:
          await _router.replaceAll([route]);
          return Future.value(null);
      }
    } catch (e, stack) {
      Log.e('Navigation error: $e \n$stack', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<bool> navigateBack<T extends Object?>([T? result]) async {
    try {
      if (_router.canPop()) {
        return await _router.maybePop(result);
      }
      return false;
    } catch (e) {
      Log.e('Go back error: $e');
      return false;
    }
  }

  Future<bool> maybePop<T extends Object?>([T? arguments]) async {
    try {
      return await _router.maybePop<T>(arguments);
    } catch (e) {
      Log.e('Maybe pop error: $e');
      return false;
    }
  }

  bool canNavigateBack() {
    return _router.canPop();
  }

  void popUntil(String routeName) {
    try {
      _router.popUntilRouteWithName(routeName);
    } catch (e) {
      Log.e('Pop until error: $e');
    }
  }

  String? getCurrentRouteName() {
    return _router.current.name;
  }

  void navigateToHome() {
    if (_homeRoute != null) {
      _router.popUntilRoot();
    } else {
      Log.w('No home route defined in NavigationHandler');
    }
  }
}

enum NavigationType { push, pushReplacement, popUntil, pushAndPopUntil, clearPush }