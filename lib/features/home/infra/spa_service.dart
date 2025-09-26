import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:shopping_cart/features/home/domain/ab_spa_service.dart';

import '../domain/spa_details_model.dart';
import '../domain/spa_model.dart';

class SpaService implements AbSpaService {
  @override
  Future<List<SpaModel>> fetchSpas() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final raw = await rootBundle.loadString('assets/json/mock_spa_list.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => SpaModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<SpaDetailsModel?> fetchSpaById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final raw = await rootBundle.loadString(
      'assets/json/mock_spa_details.json',
    );
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final spas = decoded['spas'] as List<dynamic>;
    final found = spas.cast<Map<String, dynamic>>().firstWhere(
      (m) => (m['id'] as String) == id,
      orElse: () => {},
    );
    if (found.isEmpty) return null;
    return SpaDetailsModel.fromJson(found);
  }
}
