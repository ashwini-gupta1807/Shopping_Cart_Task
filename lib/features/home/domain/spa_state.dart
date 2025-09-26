import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_cart/features/home/domain/spa_model.dart';

part 'spa_state.freezed.dart';

@freezed
abstract class SpaState with _$SpaState {
  const factory SpaState.initial() = _Initial;
  const factory SpaState.loading() = _Loading;
  const factory SpaState.loaded(List<SpaModel> spas) = _Loaded;
  const factory SpaState.error(String message) = _Error;
}
