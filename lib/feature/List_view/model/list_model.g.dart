// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResults _$ProductResultsFromJson(Map<String, dynamic> json) =>
    ProductResults(
      brand: json['brand'] as String?,
      data: json['data'] as String?,
      dislikeCount: json['dislikeCount'] as int?,
      imageId: json['imageId'] as String?,
      key: json['key'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      likeCount: json['likeCount'] as int?,
      longtitute: (json['longtitute'] as num?)?.toDouble(),
      price: json['price'] as String?,
      product: json['product'] as String?,
      storeName: json['storeName'] as String?,
      time: json['time'] as String?,
      usernameId: json['usernameId'] as String?,
    );

Map<String, dynamic> _$ProductResultsToJson(ProductResults instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'data': instance.data,
      'dislikeCount': instance.dislikeCount,
      'imageId': instance.imageId,
      'key': instance.key,
      'latitude': instance.latitude,
      'likeCount': instance.likeCount,
      'longtitute': instance.longtitute,
      'price': instance.price,
      'product': instance.product,
      'storeName': instance.storeName,
      'time': instance.time,
      'usernameId': instance.usernameId,
    };
