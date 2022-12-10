import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable()
class ProductResults {
  String? brand;
  String? data;
  int? dislikeCount;
  String? imageId;
  String? key;
  double? latitude;
  int? likeCount;
  double? longtitute;
  String? price;
  String? product;
  String? storeName;
  String? time;
  String? usernameId;

  ProductResults(
      {this.brand,
      this.data,
      this.dislikeCount,
      this.imageId,
      this.key,
      this.latitude,
      this.likeCount,
      this.longtitute,
      this.price,
      this.product,
      this.storeName,
      this.time,
      this.usernameId});

  ProductResults.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    data = json['data'];
    dislikeCount = json['dislike_count'];
    imageId = json['imageId'];
    key = json['key'];
    latitude = json['latitude'];
    likeCount = json['like_count'];
    longtitute = json['longtitute'];
    price = json['price'];
    product = json['product'];
    storeName = json['store_name'];
    time = json['time'];
    usernameId = json['usernameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['data'] = this.data;
    data['dislike_count'] = dislikeCount;
    data['imageId'] = imageId;
    data['key'] = key;
    data['latitude'] = latitude;
    data['like_count'] = likeCount;
    data['longtitute'] = longtitute;
    data['price'] = price;
    data['product'] = product;
    data['store_name'] = storeName;
    data['time'] = time;
    data['usernameId'] = usernameId;
    return data;
  }
}
