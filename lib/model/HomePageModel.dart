import 'package:json_annotation/json_annotation.dart';
import 'HomePageModelData.dart';

part 'HomePageModel.g.dart';

@JsonSerializable(nullable: true)
class HomePageModel {

  int code;
  String msg;
  HomePageModelData data;


  HomePageModel(
    this.code, 
    this.msg, 
    this.data,
  );

  Map<String, dynamic> toJson() => _$HomePageModelToJson(this);
  factory HomePageModel.fromJson(Map<String, dynamic> json) => _$HomePageModelFromJson(json);
}