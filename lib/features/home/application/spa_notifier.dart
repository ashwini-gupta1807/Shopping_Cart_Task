import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/features/home/infra/spa_service.dart';

import '../domain/spa_state.dart';

class SpaNotifier extends StateNotifier<SpaState> {
  final SpaService service;

  SpaNotifier(this.service) : super(const SpaState.initial());

  Future<void> fetchSpas() async {
    // avoid refetch if already loaded
    final current = state;
    if (current.maybeWhen(loaded: (_) => true, orElse: () => false)) return;

    state = const SpaState.loading();
    try {
      final list = await service.fetchSpas();
      state = SpaState.loaded(list);
    } catch (e) {
      state = SpaState.error(e.toString());
    }
  }

  void clear() => state = const SpaState.initial();
}
