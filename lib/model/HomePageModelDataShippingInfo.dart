import 'package:json_annotation/json_annotation.dart';

part 'HomePageModelDataShippingInfo.g.dart';

@JsonSerializable(nullable: true)
class HomePageModelDataShippingInfo {

  String name;
  String phone;
  String provinceId;
  String provinceName;
  String cityId;
  String cityName;
  String districtId;
  String districtName;
  String streetId;
  String streetName;
  String address;
  String shippingId;
  String isDefault;

  HomePageModelDataShippingInfo(
    this.name, 
    this.phone, 
    this.provinceId,
    this.provinceName,
    this.cityId,
    this.cityName,
    this.districtId,
    this.districtName,
    this.streetId,
    this.streetName,
    this.address,
    this.shippingId,
    this.isDefault,
  );

  Map<String, dynamic> toJson() => _$HomePageModelDataShippingInfoToJson(this);
  factory HomePageModelDataShippingInfo.fromJson(Map<String, dynamic> json) => _$HomePageModelDataShippingInfoFromJson(json);
}