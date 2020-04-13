// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageModelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModelData _$HomePageModelDataFromJson(Map<String, dynamic> json) {
  return HomePageModelData(
    json['productAmt'] as String,
    json['expressAmt'] as String,
    json['couponText'] as String,
    json['monthAmt'] as String,
    json['totalAmt'] as String,
    json['shippingInfo'] == null
        ? null
        : HomePageModelDataShippingInfo.fromJson(
            json['shippingInfo'] as Map<String, dynamic>),
  )..products = (json['products'] as List)
      ?.map((e) => e == null
          ? null
          : HomePageModelDataProducts.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$HomePageModelDataToJson(HomePageModelData instance) =>
    <String, dynamic>{
      'productAmt': instance.productAmt,
      'expressAmt': instance.expressAmt,
      'couponText': instance.couponText,
      'monthAmt': instance.monthAmt,
      'totalAmt': instance.totalAmt,
      'shippingInfo': instance.shippingInfo,
      'products': instance.products,
    };
