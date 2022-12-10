import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImagePostModel {
  String? data;
  String? product;
  String? brand;
  String? price;
  double? longtitute;
  double? latitude;
  String? store_name;
  String? imageId;

  ImagePostModel(
      {this.data, this.product, this.brand, this.price, this.longtitute, this.latitude, this.store_name, this.imageId});

  factory ImagePostModel.fromJson(Map<String, dynamic> json) {
    return _$ImagePostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ImagePostModelToJson(this);
  }
}
