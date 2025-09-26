// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpaModel {

 String get id; String get name; String get address; String get category; double get rating;@JsonKey(name: 'distance_km') double get distanceKm; String get offers; String get image;
/// Create a copy of SpaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpaModelCopyWith<SpaModel> get copyWith => _$SpaModelCopyWithImpl<SpaModel>(this as SpaModel, _$identity);

  /// Serializes this SpaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.category, category) || other.category == category)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.offers, offers) || other.offers == offers)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,category,rating,distanceKm,offers,image);

@override
String toString() {
  return 'SpaModel(id: $id, name: $name, address: $address, category: $category, rating: $rating, distanceKm: $distanceKm, offers: $offers, image: $image)';
}


}

/// @nodoc
abstract mixin class $SpaModelCopyWith<$Res>  {
  factory $SpaModelCopyWith(SpaModel value, $Res Function(SpaModel) _then) = _$SpaModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String category, double rating,@JsonKey(name: 'distance_km') double distanceKm, String offers, String image
});




}
/// @nodoc
class _$SpaModelCopyWithImpl<$Res>
    implements $SpaModelCopyWith<$Res> {
  _$SpaModelCopyWithImpl(this._self, this._then);

  final SpaModel _self;
  final $Res Function(SpaModel) _then;

/// Create a copy of SpaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? category = null,Object? rating = null,Object? distanceKm = null,Object? offers = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpaModel].
extension SpaModelPatterns on SpaModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpaModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpaModel value)  $default,){
final _that = this;
switch (_that) {
case _SpaModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpaModel value)?  $default,){
final _that = this;
switch (_that) {
case _SpaModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String category,  double rating, @JsonKey(name: 'distance_km')  double distanceKm,  String offers,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpaModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.category,_that.rating,_that.distanceKm,_that.offers,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String category,  double rating, @JsonKey(name: 'distance_km')  double distanceKm,  String offers,  String image)  $default,) {final _that = this;
switch (_that) {
case _SpaModel():
return $default(_that.id,_that.name,_that.address,_that.category,_that.rating,_that.distanceKm,_that.offers,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String category,  double rating, @JsonKey(name: 'distance_km')  double distanceKm,  String offers,  String image)?  $default,) {final _that = this;
switch (_that) {
case _SpaModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.category,_that.rating,_that.distanceKm,_that.offers,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpaModel implements SpaModel {
  const _SpaModel({required this.id, required this.name, required this.address, required this.category, required this.rating, @JsonKey(name: 'distance_km') required this.distanceKm, required this.offers, required this.image});
  factory _SpaModel.fromJson(Map<String, dynamic> json) => _$SpaModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String category;
@override final  double rating;
@override@JsonKey(name: 'distance_km') final  double distanceKm;
@override final  String offers;
@override final  String image;

/// Create a copy of SpaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpaModelCopyWith<_SpaModel> get copyWith => __$SpaModelCopyWithImpl<_SpaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.category, category) || other.category == category)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.offers, offers) || other.offers == offers)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,category,rating,distanceKm,offers,image);

@override
String toString() {
  return 'SpaModel(id: $id, name: $name, address: $address, category: $category, rating: $rating, distanceKm: $distanceKm, offers: $offers, image: $image)';
}


}

/// @nodoc
abstract mixin class _$SpaModelCopyWith<$Res> implements $SpaModelCopyWith<$Res> {
  factory _$SpaModelCopyWith(_SpaModel value, $Res Function(_SpaModel) _then) = __$SpaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String category, double rating,@JsonKey(name: 'distance_km') double distanceKm, String offers, String image
});




}
/// @nodoc
class __$SpaModelCopyWithImpl<$Res>
    implements _$SpaModelCopyWith<$Res> {
  __$SpaModelCopyWithImpl(this._self, this._then);

  final _SpaModel _self;
  final $Res Function(_SpaModel) _then;

/// Create a copy of SpaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? category = null,Object? rating = null,Object? distanceKm = null,Object? offers = null,Object? image = null,}) {
  return _then(_SpaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
