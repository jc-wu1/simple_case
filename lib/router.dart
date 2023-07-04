import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_case/login_page.dart';
import 'package:simple_case/profile_page.dart';
import 'package:simple_case/setting_page.dart';

import 'cubit/auth_cubit.dart';
import 'go_router_refresh.dart';
import 'home_page.dart';
import 'nav_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(
  debugLabel: 'shell',
);

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(
    this.authCubit,
  );

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(
      authCubit.stream,
    ),
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        path: '/',
        name: 'login',
        pageBuilder: (_, state) {
          return NoTransitionPage(
            child: LoginPage(
              key: state.pageKey,
            ),
          );
        },
        redirect: (context, state) {
          if (authCubit.state.status == AuthStatus.authenticated) {
            return '/home';
          }
          return null;
        },
      ),
      ShellRoute(
        // navigatorKey: _shellNavigator,
        builder: (_, state, child) => NavigationPage(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (_, state) {
              return NoTransitionPage(
                child: HomePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/setting',
            name: 'setting',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ProfilePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      )
    ],
  );
}
