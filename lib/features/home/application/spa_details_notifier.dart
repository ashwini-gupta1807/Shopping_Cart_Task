import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/features/home/infra/spa_service.dart';

import '../domain/spa_details_state.dart';

class SpaDetailsNotifier extends StateNotifier<SpaDetailsState> {
  final SpaService service;
  SpaDetailsNotifier(this.service) : super(SpaDetailsState.initial());

  Future<void> fetchById(String id) async {
    state = const SpaDetailsState.loading();
    try {
      final spa = await service.fetchSpaById(id);
      if (spa == null) {
        state = const SpaDetailsState.error('Spa not found');
        return;
      }
      state = SpaDetailsState.loaded(spa);
    } catch (e) {
      state = SpaDetailsState.error(e.toString());
    }
  }

  void clear() => state = const SpaDetailsState.initial();
}
