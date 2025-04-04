// lib/framework/navigation/app_router.dart

import 'package:flutter/material.dart';
import '../views/login_view.dart';
import '../views/main_tab_screen.dart';

enum AppRoute {
  login,
  main,
}

class AppRouter extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  
  AppRoute _currentRoute = AppRoute.login;
  
  AppRouter() : navigatorKey = GlobalKey<NavigatorState>() {
    _checkInitialRoute();
  }
  
  AppRoute get currentRoute => _currentRoute;
  
  Future<void> _checkInitialRoute() async {
    // Aquí podríamos verificar si el usuario ya tiene sesión
    // y establecer la ruta inicial adecuada
  }
  
  void navigateToMain() {
    _currentRoute = AppRoute.main;
    notifyListeners();
  }
  
  void navigateToLogin() {
    _currentRoute = AppRoute.login;
    notifyListeners();
  }
  
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentRoute == AppRoute.login)
          MaterialPage(
            key: const ValueKey('LoginPage'),
            child: LoginScreen(
              onLogin: navigateToMain,
            ),
          ),
          
        if (_currentRoute == AppRoute.main)
          MaterialPage(
            key: const ValueKey('MainPage'),
            child: MainTabScreen(
              onLogout: navigateToLogin,
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }
  
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    _currentRoute = configuration;
    return;
  }
}