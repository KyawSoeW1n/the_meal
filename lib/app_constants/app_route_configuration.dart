import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/app_constants/app_routes.dart';

import '../features/favourite_meals/favourite_meals_screen.dart';
import '../features/meals/meal_list_screen.dart';
import '../features/setting/setting_screen.dart';
import '../features/user/user_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.post,
      builder: (BuildContext context, GoRouterState state) {
        return MealListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.setting,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.favourite,
          builder: (BuildContext context, GoRouterState state) {
            return FavouriteMealsScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.user,
          builder: (BuildContext context, GoRouterState state) {
            return UserScreen();
          },
        ),
      ],
    ),
  ],
);
