// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageModelDataShippingInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModelDataShippingInfo _$HomePageModelDataShippingInfoFromJson(
    Map<String, dynamic> json) {
  return HomePageModelDataShippingInfo(
    json['name'] as String,
    json['phone'] as String,
    json['provinceId'] as String,
    json['provinceName'] as String,
    json['cityId'] as String,
    json['cityName'] as String,
    json['districtId'] as String,
    json['districtName'] as String,
    json['streetId'] as String,
    json['streetName'] as String,
    json['address'] as String,
    json['shippingId'] as String,
    json['isDefault'] as String,
  );
}

Map<String, dynamic> _$HomePageModelDataShippingInfoToJson(
        HomePageModelDataShippingInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'streetId': instance.streetId,
      'streetName': instance.streetName,
      'address': instance.address,
      'shippingId': instance.shippingId,
      'isDefault': instance.isDefault,
    };
