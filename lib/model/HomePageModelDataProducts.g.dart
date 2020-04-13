// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageModelDataProducts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModelDataProducts _$HomePageModelDataProductsFromJson(
    Map<String, dynamic> json) {
  return HomePageModelDataProducts(
    json['productId'] as String,
    json['productName'] as String,
    json['productPrice'] as String,
    json['monthAmt'] as String,
    json['imgUrl'] as String,
    json['specText'] as String,
    json['count'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$HomePageModelDataProductsToJson(
        HomePageModelDataProducts instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'monthAmt': instance.monthAmt,
      'imgUrl': instance.imgUrl,
      'specText': instance.specText,
      'count': instance.count,
      'status': instance.status,
    };
