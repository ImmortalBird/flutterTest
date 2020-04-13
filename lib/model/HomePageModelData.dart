import 'package:json_annotation/json_annotation.dart';
import 'HomePageModelDataShippingInfo.dart';
import 'HomePageModelDataProducts.dart';

part 'HomePageModelData.g.dart';

@JsonSerializable(nullable: true)
class HomePageModelData {

  String productAmt;
  String expressAmt;
  String couponText;
  String monthAmt;
  String totalAmt;
  HomePageModelDataShippingInfo shippingInfo;
  List <HomePageModelDataProducts> products;

  HomePageModelData(
    this.productAmt, 
    this.expressAmt,
    this.couponText,
    this.monthAmt,
    this.totalAmt,
    this.shippingInfo,
  );

  Map<String, dynamic> toJson() => _$HomePageModelDataToJson(this);
  factory HomePageModelData.fromJson(Map<String, dynamic> json) => _$HomePageModelDataFromJson(json);
}