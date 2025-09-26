import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/core/utils/helpers/local_storage.dart';

class LocationNotifier extends StateNotifier<bool?> {
  static const _key = 'location_enabled';

  LocationNotifier() : super(null) {
    // initialize from local storage (GetStorage is synchronous)
    final stored = LocalStorage.readData<bool>(key: _key);
    state = stored;
  }

  void enable() {
    state = true;
    LocalStorage.saveData<bool>(key: _key, value: true);
  }

  void disable() {
    state = false;
    LocalStorage.saveData<bool>(key: _key, value: false);
  }
}
