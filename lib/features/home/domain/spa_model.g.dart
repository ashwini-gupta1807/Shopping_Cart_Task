// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpaModel _$SpaModelFromJson(Map<String, dynamic> json) => _SpaModel(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  category: json['category'] as String,
  rating: (json['rating'] as num).toDouble(),
  distanceKm: (json['distance_km'] as num).toDouble(),
  offers: json['offers'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$SpaModelToJson(_SpaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'category': instance.category,
  'rating': instance.rating,
  'distance_km': instance.distanceKm,
  'offers': instance.offers,
  'image': instance.image,
};
