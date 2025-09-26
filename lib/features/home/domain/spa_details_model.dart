import 'package:freezed_annotation/freezed_annotation.dart';

part 'spa_details_model.freezed.dart';
part 'spa_details_model.g.dart';

@freezed
abstract class SpaDetailsModel with _$SpaDetailsModel {
  const factory SpaDetailsModel({
    required String id,
    required String name,
    required String address,
    required String location,
    required double rating,
    @JsonKey(name: 'distance_km') required double distanceKm,
    required String image,
    @JsonKey(name: 'banner_image') required String bannerImage,
    dynamic offers,
    required List<CategoryModel> categories,
  }) = _SpaDetailsModel;

  factory SpaDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SpaDetailsModelFromJson(json);
}

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required List<ServiceModel> services,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required String id,
    required String name,
    required int price,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required String mode,
    required String description,
    required String image,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}
