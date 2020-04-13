import 'package:json_annotation/json_annotation.dart';

part 'HomePageModelDataProducts.g.dart';

@JsonSerializable(nullable: true)
class HomePageModelDataProducts {

  String productId;
  String productName;
  String productPrice;
  String monthAmt;
  String imgUrl;
  String specText;
  String count;
  String status;

  HomePageModelDataProducts(
    this.productId, 
    this.productName, 
    this.productPrice,
    this.monthAmt,
    this.imgUrl,
    this.specText,
    this.count,
    this.status,
  );

  Map<String, dynamic> toJson() => _$HomePageModelDataProductsToJson(this);
  factory HomePageModelDataProducts.fromJson(Map<String, dynamic> json) => _$HomePageModelDataProductsFromJson(json);
}