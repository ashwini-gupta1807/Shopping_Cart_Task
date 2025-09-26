// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpaDetailsModel _$SpaDetailsModelFromJson(Map<String, dynamic> json) =>
    _SpaDetailsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      image: json['image'] as String,
      bannerImage: json['banner_image'] as String,
      offers: json['offers'],
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpaDetailsModelToJson(_SpaDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'location': instance.location,
      'rating': instance.rating,
      'distance_km': instance.distanceKm,
      'image': instance.image,
      'banner_image': instance.bannerImage,
      'offers': instance.offers,
      'categories': instance.categories,
    };

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'services': instance.services,
    };

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      mode: json['mode'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'duration_minutes': instance.durationMinutes,
      'mode': instance.mode,
      'description': instance.description,
      'image': instance.image,
    };
