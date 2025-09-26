import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/core/utils/helpers/local_storage.dart';
import 'package:shopping_cart/features/home/domain/cart_item_model.dart';

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  static const _key = 'cart_items_v1';
  CartNotifier() : super([]) {
    _load();
  }

  void _load() {
    final raw = LocalStorage.readData<String>(key: _key);
    if (raw == null || raw.isEmpty) return;
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      state = list
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      state = [];
    }
  }

  void _save() {
    final raw = jsonEncode(state.map((e) => e.toJson()).toList());
    LocalStorage.saveData<String>(key: _key, value: raw);
  }

  void add(CartItemModel item) {
    final exists = state.any(
      (c) => c.serviceId == item.serviceId && c.spaId == item.spaId,
    );
    if (!exists) {
      state = [...state, item];
      _save();
    }
  }

  void remove(String serviceId, String spaId) {
    state = state
        .where((c) => !(c.serviceId == serviceId && c.spaId == spaId))
        .toList();
    _save();
  }

  void clear() {
    state = [];
    _save();
  }

  int get totalPrice => state.fold(0, (s, i) => s + i.price);
}
