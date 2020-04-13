import 'dart:convert';
import 'dart:io';
import 'package:cashier/model/pay_channel_entity.dart';
import 'package:dio/dio.dart';

class DartHttpUtils {
  //配置dio，通过BaseOptions
  Dio _dio = Dio(BaseOptions(
      baseUrl: "https://abc.com:8090/",
      connectTimeout: 5000,
      receiveTimeout: 5000));

  //dio的GET请求
  getDio() async {
    var url = "/path1?name=abc&pwd=123";
    _dio.get(url).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    });
  }

  getUriDio() async {
    var url = "/path1?name=abc&pwd=123";
    _dio.getUri(Uri.parse(url)).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

//dio的GET请求，通过queryParameters配置传递参数
  getParametersDio() async {
    var url = "/path1";
    _dio.get(url, queryParameters: {"name": 'abc', "pwd": 123}).then(
            (Response response) {
          if (response.statusCode == 200) {
            print(response.data.toString());
          }
        }).catchError((error) {
      print(error.toString());
    });
  }

//发送POST请求，application/x-www-form-urlencoded
  postUrlencodedDio() async {
    var url = "/path2";
    _dio
        .post(url,
        data: {"name": 'value1', "pwd": 123},
        options: Options(
            contentType:
            ContentType.parse("application/x-www-form-urlencoded")))
        .then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  //发送POST请求，application/json
  postJsonDio() async {
    var url = "/path3";
    _dio
        .post(url,
        data: {"name": 'value1', "pwd": 123},
        options: Options(contentType: ContentType.json))
        .then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
  //发送POST请求，application/json
  getPayChannel(String orderNo,Function(PayChannelEntity entity) fun) async {
    var url = "https://api.quanfenshop.com/cash/channel";
    Map<String, dynamic> headers = Map();
    headers['Cookie'] = "gr_user_id=bfb78398-dff5-46b5-9fe7-1dce5ced1b12; grwng_uid=30cbeedc-e36d-4c4c-808a-f4830e865ce5; SUN=18610644462; platform=android; androidAppVersion=1.3.3; platform=android; ad49d9d009f6abb3_gr_session_id=31f28cf1-6b79-4235-bed4-e97e0ceefd7e; ad49d9d009f6abb3_gr_session_id_31f28cf1-6b79-4235-bed4-e97e0ceefd7e=true; upi=eyJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIyMjMxMTI5NzQwNjciLCJkZXZpY2VJZCI6IjY0MTY2OTgwMzQ5MjcyNDczNiIsInN1YiI6IjIyMzExMjk3NDA2NyIsImlhdCI6MTU4NjUwNDYyNiwiZXhwIjoxNTg3NzE0MjI2LCJpc3MiOiJiYmNjb3JlLXdlYiIsImF1ZCI6ImJjYy1hcHAifQ.c3gT1WlYD9npX_kZ9NSHiaKE6_cJfrr01HU7JO0PdQk";
    _dio
        .post(url,
        data: {"client":"2","orderNo":"$orderNo"},
        options: Options(headers: headers))
        .then((Response response) {
      if (response.statusCode == 200) {
        fun(PayChannelEntity().fromJson(jsonDecode(response.toString())));
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  // 发送POST请求，multipart/form-data
  postFormDataDio() async {
    var url = "/path4";
    FormData _formData = FormData.from({
      "name": "value1",
      "pwd": 123,
    });
    _dio.post(url, data: _formData).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  // 发送POST请求，multipart/form-data，上传文件
  postFileDio() async {
    var url = "/path5";
    FormData _formData = FormData.from({
      "description": "descriptiondescription",
      "file": UploadFileInfo(File("./example/upload.txt"), "upload.txt")
    });
    _dio.post(url, data: _formData).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  //dio下载文件
  downloadFileDio() {
    var urlPath = "https://abc.com:8090/";
    var savePath = "./abc.html";
    _dio.download(urlPath, savePath).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

///其余的HEAD、PUT、DELETE请求用法类似，大同小异，大家可以自己试一下
///在Widget里请求成功数据后，使用setState来更新内容和状态即可
///setState(() {
///    ...
///  });
}