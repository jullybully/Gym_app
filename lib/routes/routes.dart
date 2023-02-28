import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/navigation_bar.dart';
import '../pages/workout_page.dart';
import '../pages/plan_page.dart';
import '../pages/home_page.dart';

final _rootNavigatorKey = GlobalKey();
final _shellNavigatorKey = GlobalKey();
final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: '/workout',
          builder: (BuildContext context, GoRouterState state) {
            return WorkoutPage();
          },
        ),
        GoRoute(
          path: '/plan',
          builder: (BuildContext context, GoRouterState state) {
            return PlanPage();
          },
        ),
      ],
    ),
  ],
);
