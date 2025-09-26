import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/features/home/infra/spa_service.dart';

import '../application/cart_notifier.dart';
import '../application/location_notifier.dart';
import '../application/spa_details_notifier.dart';
import '../application/spa_notifier.dart';
import '../domain/cart_item_model.dart';
import '../domain/spa_details_state.dart';
import '../domain/spa_model.dart';
import '../domain/spa_state.dart';

final locationProvider = StateNotifierProvider<LocationNotifier, bool?>(
  (ref) => LocationNotifier(),
);

final spaServiceProvider = Provider<SpaService>((ref) => SpaService());

final spaNotifierProvider = StateNotifierProvider<SpaNotifier, SpaState>((ref) {
  final service = ref.watch(spaServiceProvider);
  return SpaNotifier(service);
});

final spaSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredSpasProvider = Provider<List<SpaModel>>((ref) {
  final query = ref.watch(spaSearchQueryProvider).trim().toLowerCase();
  final spaState = ref.watch(spaNotifierProvider);

  return spaState.maybeWhen(
    loaded: (spas) {
      if (query.isEmpty) return spas;
      return spas.where((s) {
        final name = s.name.toLowerCase();
        final address = s.address.toLowerCase();
        final category = s.category.toLowerCase();
        return name.contains(query) ||
            address.contains(query) ||
            category.contains(query);
      }).toList();
    },
    orElse: () => [],
  );
});

final spaDetailsNotifierProvider =
    StateNotifierProvider<SpaDetailsNotifier, SpaDetailsState>(
      (ref) => SpaDetailsNotifier(ref.read(spaServiceProvider)),
    );

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItemModel>>(
  (ref) => CartNotifier(),
);
