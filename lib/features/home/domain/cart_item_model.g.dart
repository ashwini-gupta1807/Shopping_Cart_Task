// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      serviceId: json['serviceId'] as String,
      spaId: json['spaId'] as String,
      mode: json['mode'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'spaId': instance.spaId,
      'mode': instance.mode,
      'name': instance.name,
      'price': instance.price,
      'duration_minutes': instance.durationMinutes,
    };
