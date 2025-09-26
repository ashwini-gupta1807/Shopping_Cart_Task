import 'package:freezed_annotation/freezed_annotation.dart';

import 'spa_details_model.dart';

part 'spa_details_state.freezed.dart';

@freezed
abstract class SpaDetailsState with _$SpaDetailsState {
  const factory SpaDetailsState.initial() = _Initial;
  const factory SpaDetailsState.loading() = _Loading;
  const factory SpaDetailsState.loaded(SpaDetailsModel spa) = _Loaded;
  const factory SpaDetailsState.error(String message) = _Error;
}
