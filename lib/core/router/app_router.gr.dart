// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [SpaDetailsScreen]
class SpaDetailsRoute extends PageRouteInfo<SpaDetailsRouteArgs> {
  SpaDetailsRoute({
    Key? key,
    required String spaId,
    List<PageRouteInfo>? children,
  }) : super(
         SpaDetailsRoute.name,
         args: SpaDetailsRouteArgs(key: key, spaId: spaId),
         initialChildren: children,
       );

  static const String name = 'SpaDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SpaDetailsRouteArgs>();
      return SpaDetailsScreen(key: args.key, spaId: args.spaId);
    },
  );
}

class SpaDetailsRouteArgs {
  const SpaDetailsRouteArgs({this.key, required this.spaId});

  final Key? key;

  final String spaId;

  @override
  String toString() {
    return 'SpaDetailsRouteArgs{key: $key, spaId: $spaId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpaDetailsRouteArgs) return false;
    return key == other.key && spaId == other.spaId;
  }

  @override
  int get hashCode => key.hashCode ^ spaId.hashCode;
}
