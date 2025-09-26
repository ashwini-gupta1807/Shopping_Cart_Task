import 'package:freezed_annotation/freezed_annotation.dart';

part 'spa_model.freezed.dart';
part 'spa_model.g.dart';

@freezed
abstract class SpaModel with _$SpaModel {
  const factory SpaModel({
    required String id,
    required String name,
    required String address,
    required String category,
    required double rating,
    @JsonKey(name: 'distance_km') required double distanceKm,
    required String offers,
    required String image,
  }) = _SpaModel;

  factory SpaModel.fromJson(Map<String, dynamic> json) =>
      _$SpaModelFromJson(json);
}
