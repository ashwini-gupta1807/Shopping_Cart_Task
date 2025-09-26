import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/cart_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/spa_details_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<CustomRoute> get routes => [
    CustomRoute(page: HomeRoute.page, path: '/home', initial: true),
    CustomRoute(
      page: SpaDetailsRoute.page,
      path: '/spa-details',
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: CartRoute.page,
      path: '/cart',
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ];
}
