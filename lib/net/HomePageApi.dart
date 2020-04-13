import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:cashier/model/HomePageModel.dart';

class HomePageApi {

  loadLocalNewFansData(String jsonStr) {
    
    var json = jsonDecode(jsonStr);
    HomePageModel model = HomePageModel.fromJson(json);
    return model;
  }

  static Future<HomePageModel> requestNewFans() async {
    Dio _dio = new Dio();
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //       client.findProxy = (url) {
    //         return "PROXY 172.17.61.229:8888";
    //       };
    //       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    // };

    var productsArr = [
      {
      'productId' : '2103794985',
      'count' : '1'
      },
      {
      'productId' : '13034124',
      'count' : '1'
      },
      {
      'productId' : '1135468',
      'count' : '1'
      },
      {
      'productId' : '1229809',
      'count' : '1'
      },
      {
      'productId' : '16162761',
      'count' : '4'
      },
    ];
    var params = {
      'products': productsArr,
    };
    Map <String, dynamic>headers = new Map();
    headers['Cookie'] = 'platform=ios; upi=eyJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiI2NDY5ODUwMTE2NTUiLCJkZXZpY2VJZCI6IjYzN0JFNzdGLTExMTEtNDg4Mi04NDVELTNEMzExMjBGNDc0OSIsInN1YiI6IjY0Njk4NTAxMTY1NSIsImlhdCI6MTU4NjQyMzUyMiwiZXhwIjoxNTg3NjMzMTIyLCJpc3MiOiJiYmNjb3JlLXdlYiIsImF1ZCI6ImJjYy1hcHAifQ.rDW6jtO48IS4mWNHnBhwjO5EjFxv83_i1IozPddnsTo';
    Options options = new Options(
      headers : headers
    );
    options.headers = headers;
    
    var response = await _dio.post("https://api.quanfenshop.com/order/preSubmit",data:params, options: options);
    print(response);
    print('----');
    print(response.toString());
    var json = jsonDecode(response.toString());
    HomePageModel model = HomePageModel.fromJson(json);
    return model;
  }
}