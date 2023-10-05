import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:peltar/view/view_import.dart';
import 'package:peltar/viewmodel/login_viewmodel.dart';

class AppRoute {
  final LoginViewModel loginViewModel;
  AppRoute(this.loginViewModel);
  late final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/detail-asset',
          name: '/detail-asset',
          builder: (context, state) {
            return const DetailAssetScreen();
          },
        ),
        GoRoute(
            path: '/form-inspection',
            name: '/form-inspection',
            builder: (context, state) {
              int id = state.extra as int;
              return FormInspectionScreen(
                id: id,
              );
            }),
        GoRoute(
          name: 'home',
          path: '/:tab',
          builder: (context, state) {
            final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
            return Home(key: state.pageKey, currentTab: tab);
          },
          routes: [
            GoRoute(
                path: 'assets',
                name: 'assets',
                builder: (context, state) => const AssetsScreens()),
            GoRoute(
                path: 'maintenance',
                name: 'maintenance',
                builder: (context, state) => const MaintenanceScreen()),
            GoRoute(
                path: 'inspection',
                name: 'inspection',
                builder: (context, state) => const Placeholder()),
            GoRoute(
                path: 'scan',
                name: 'scan',
                builder: (context, state) => const ScanScreen())
          ],
        )
      ],
      redirect: (context, state) {
        if (state.subloc == '/login') {
          return loginViewModel.loggedIn ? '/home' : '/login';
        }
        return null;
      });
}
