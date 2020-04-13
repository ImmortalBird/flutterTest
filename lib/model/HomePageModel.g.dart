// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) {
  return HomePageModel(
    json['code'] as int,
    json['msg'] as String,
    json['data'] == null
        ? null
        : HomePageModelData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomePageModelToJson(HomePageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
