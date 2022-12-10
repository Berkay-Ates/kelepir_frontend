// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagePostModel _$ImagePostModelFromJson(Map<String, dynamic> json) =>
    ImagePostModel(
      data: json['data'] as String?,
      product: json['product'] as String?,
      brand: json['brand'] as String?,
      price: json['price'] as String?,
      longtitute: (json['longtitute'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      store_name: json['store_name'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$ImagePostModelToJson(ImagePostModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'product': instance.product,
      'brand': instance.brand,
      'price': instance.price,
      'longtitute': instance.longtitute,
      'latitude': instance.latitude,
      'store_name': instance.store_name,
      'imageId': instance.imageId,
    };
