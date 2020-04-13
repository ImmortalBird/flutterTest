import 'dart:convert';
import 'dart:io';
import 'package:cashier/model/pay_channel_entity.dart';
import 'package:cashier/widget/Toast.dart';
import 'package:flutter/material.dart';
import 'RoundCheckBox.dart';
import 'http/HttpUtils.dart';

class MyHttpClient extends StatefulWidget {
  final String title = "收银台";

  @override
  State<StatefulWidget> createState() {
    var myHttpClientState = MyHttpClientState();
    myHttpClientState.getData();
    return myHttpClientState;
  }
}

class MyHttpClientState extends State<MyHttpClient> {
  PayChannelEntity _data;
  String _select = "";

  // ignore: unused_element
  Future<String> _fetch() async {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = Duration(
      seconds: 20,
    );
    var parse = Uri.parse("https://api.quanfenshop.com/personal/homePage");
    HttpClientRequest request = await httpClient.postUrl(parse);
    request.headers.contentType = ContentType("application", "json");
    request.write("{'client':'2','orderNo':'10698176125318680581'}");
    request.cookies.add(Cookie("androidAppVersion", "1.3.0"));
    request.cookies
        .add(Cookie("gr_user_id", "bfb78398-dff5-46b5-9fe7-1dce5ced1b12"));
    request.cookies
        .add(Cookie("grwng_uid", "30cbeedc-e36d-4c4c-808a-f4830e865ce5"));
    request.cookies.add(Cookie("ad49d9d009f6abb3_gr_session_id",
        "b2ce0b20-3dc4-487c-9699-557a708d8a8e"));
    request.cookies.add(Cookie(
        "ad49d9d009f6abb3_gr_session_id_b2ce0b20-3dc4-487c-9699-557a708d8a8e",
        "true"));
    request.cookies.add(Cookie("upi",
        "eyJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiIyMjMxMTI5NzQwNjciLCJkZXZpY2VJZCI6IjY0MTY2OTgwMzQ5MjcyNDczNiIsInN1YiI6IjIyMzExMjk3NDA2NyIsImlhdCI6MTU4NjUwNDYyNiwiZXhwIjoxNTg3NzE0MjI2LCJpc3MiOiJiYmNjb3JlLXdlYiIsImF1ZCI6ImJjYy1hcHAifQ.c3gT1WlYD9npX_kZ9NSHiaKE6_cJfrr01HU7JO0PdQk"));
    request.cookies.add(Cookie("SUN", "18610644462"));
    request.cookies.add(Cookie("platform", "android"));
    var response = await request.close();
    return response.statusCode == HttpStatus.ok
        ? response.transform(Utf8Decoder()).join()
        : throw Exception("异常");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFF1A191E)),
        ),
        leading: IconButton(
          icon: Image.asset("images/back.png"),
          onPressed: onBackPressed,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
            child: ListView.builder(
                itemCount: (_data?.data?.payChannels?.length == null ||
                        _data?.data?.payChannels?.length == 0)
                    ? 1
                    : _data.data.payChannels.length + 1,
                itemBuilder: (context, index) {
                  print("index = $index ");

                  if (index == 0) {
                    // 顶部结算信息
                    return Container(
                      height: 70,
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "订单金额",
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: "苹方-简 中黑体",
                              ),
                            ),
                          ),
                          Text(
//                          "￥371.00",
                            "￥${_data?.data?.orderAmt == null ? "" : _data.data.orderAmt}",
                            style: TextStyle(
                              color: Color(0xFF1C1717),
                              fontSize: 18,
                              fontFamily: "苹方-简 中黑体",
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    );
                  } else {
                    PayChannelDataPayChannel payChannel =
                        _data.data.payChannels[index - 1];
                    String image = "";
                    if (payChannel.isDefault == "1") {
//                      _select = payChannel.channelCode;
                      _select = payChannel.channelName;
                    }
                    switch (payChannel.channelCode) {
                      case "1":
                        image = "images/kzp.png";
                        break;
                      case "2":
                        image = "images/wx.png";
                        break;
                      case "3":
                        image = "images/zfb.png";
                        break;
                    }
                    return
                        // 库分期
                        Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: <Widget>[
                          Image.asset(image),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  payChannel.channelName,
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  (payChannel.channelCode == "1")
                                      ? '双11最高可减800元'
                                      : "",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: (payChannel.channelCode == "1")
                                        ? 11
                                        : 0,
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                          Expanded(
                            child: Text(
                              (payChannel.channelCode == "1")
                                  ? "点击“去支付”可选择分期"
                                  : "",
                              style: TextStyle(
                                color: Color(0xFFF64F2F),
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          RoundCheckBox(
                            value: payChannel.isDefault == "1",
                            colorCheck: Color(0xFFF94D41),
                            onChanged: (b) => {
                              for (PayChannelDataPayChannel channel
                                  in _data.data.payChannels)
                                {
                                  if (payChannel == channel)
                                    {
                                      channel.isDefault = "1",
                                    }
                                  else
                                    {
                                      channel.isDefault = "0",
                                    }
                                },
                              setState(() {
                                payChannel.isDefault = "1";
                                print('目前选择 : ${payChannel.channelName}');
                              })
                            },
                          ),
                        ],
                      ),
                      height: 61.5,
                    );
                  }
                })
//        ListView(
//          children: _widgets,
//        ),
//        ListView(
//          children: <Widget>[
//            // 顶部结算信息
//            Container(
//              height: 70,
//              color: Colors.white,
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Text(
//                      "订单金额",
//                      style: TextStyle(
//                        color: Color(0xFF333333),
//                        fontSize: 14,
//                        fontFamily: "苹方-简 中黑体",
//                      ),
//                    ),
//                  ),
//                  Text(
//                    "￥371.00",
//                    style: TextStyle(
//                      color: Color(0xFF1C1717),
//                      fontSize: 18,
//                      fontFamily: "苹方-简 中黑体",
//                    ),
//                    textAlign: TextAlign.end,
//                  ),
//                ],
//              ),
//            ),
//            // 分隔线
//            Container(
//              height: 5,
//              color: Color(0xFFEEEEEE),
//            ),
//            // 库分期
//            Container(
//              color: Colors.white,
//              padding: EdgeInsets.only(left: 15, right: 15),
//              child: Row(
//                children: <Widget>[
//                  Image.asset("images/zfb.png"),
//                  Container(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          "库分期",
//                          style: TextStyle(
//                            color: Color(0xFF333333),
//                            fontSize: 14,
//                          ),
//                        ),
//                        Text(
//                          '双11最高可减8000元',
//                          style: TextStyle(
//                            color: Color(0xFF999999),
//                            fontSize: 11,
//                          ),
//                        ),
//                      ],
//                    ),
//                    margin: EdgeInsets.only(left: 10),
//                  ),
//                  Expanded(
//                    child: Text(
//                      "点击“去支付”可选择分期",
//                      style: TextStyle(
//                        color: Color(0xFFF64F2F),
//                        fontSize: 10,
//                      ),
//                      textAlign: TextAlign.end,
//                    ),
//                  ),
//                  RoundCheckBox(
//                    value: _select == "kfq",
//                    colorCheck: Color(0xFFF94D41),
//                    onChanged: (b) =>
//                    {
//                      setState(() {
//                        _select = "kfq";
//                        print('目前选择 : $_select');
//                      })
//                    },
//                  ),
//                ],
//              ),
//              height: 61.5,
//            ),
//            // 分隔线
//            Container(
//              height: 0.5,
//              color: Color(0xFFEEEEEE),
//              margin: EdgeInsets.only(left: 15),
//            ),
//            // 库支票
//            Container(
//              color: Colors.white,
//              padding: EdgeInsets.only(left: 15, right: 15),
//              child: Row(
//                children: <Widget>[
//                  Image.asset("images/kzp.png"),
//                  Container(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          "库支票分期",
//                          style: TextStyle(
//                            color: Color(0xFF333333),
//                            fontSize: 14,
//                          ),
//                        ),
//                        Text(
//                          '双11最高可减800元',
//                          style: TextStyle(
//                            color: Color(0xFF999999),
//                            fontSize: 11,
//                          ),
//                        ),
//                      ],
//                    ),
//                    margin: EdgeInsets.only(left: 10),
//                  ),
//                  Expanded(
//                    child: Text(
//                      "点击“去支付”可选择分期",
//                      style: TextStyle(
//                        color: Color(0xFFF64F2F),
//                        fontSize: 10,
//                      ),
//                      textAlign: TextAlign.end,
//                    ),
//                  ),
//                  RoundCheckBox(
//                    value: _select == "kzp",
//                    colorCheck: Color(0xFFF94D41),
//                    onChanged: (b) =>
//                    {
//                      setState(() {
//                        _select = "kzp";
//                        print('目前选择 : $_select');
//                      })
//                    },
//                  ),
//                ],
//              ),
//              height: 61.5,
//            ),
//            // 分隔线
//            Container(
//              height: 0.5,
//              color: Color(0xFFEEEEEE),
//              margin: EdgeInsets.only(left: 15),
//            ),
//            // 微信
//            Container(
//              color: Colors.white,
//              padding: EdgeInsets.only(left: 15, right: 15),
//              child: Row(
//                children: <Widget>[
//                  Image.asset("images/wx.png"),
//                  Container(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          "微信支付",
//                          style: TextStyle(
//                            color: Color(0xFF333333),
//                            fontSize: 14,
//                          ),
//                        ),
//                      ],
//                    ),
//                    margin: EdgeInsets.only(left: 10),
//                  ),
//                  Expanded(
//                    child: Text(""),
//                  ),
//                  RoundCheckBox(
//                    value: _select == "wx",
//                    colorCheck: Color(0xFFF94D41),
//                    onChanged: (b) =>
//                    {
//                      setState(() {
//                        _select = "wx";
//                        print('目前选择 : $_select');
//                      })
//                    },
//                  ),
//                ],
//              ),
//              height: 61.5,
//            ),
//            // 分隔线
//            Container(
//              height: 0.5,
//              color: Color(0xFFEEEEEE),
//              margin: EdgeInsets.only(left: 15),
//            ),
//            Text(_response),
//            RaisedButton(
//              onPressed: getData,
//            )
//          ],
//        ),
            ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: onCommit,
        child: Container(
          width: 345,
          height: 49,
          color: Color(0xFFF94D41),
          margin: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Text(
            '去支付 ${_data?.data?.orderAmt ?? ""}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: "苹方-简 常规体",
            ),
          ),
        ),
      ),
    );
  }

  getData() async {
//    String s = await _fetch();
//    Map userMap = json.decode(s);
//    var movies = new UserEntity().fromJson(userMap);
//    print("开始请求 ${movies.toJson()}");
    print("开始请求");
    DartHttpUtils().getPayChannel("10699212485399891973", (p) {
      print("请求结束 回调");
      setState(() {
        _data = p;
        print("请求结束 ${_data.toString()}");
      });
    });
  }

  // ignore: unused_element
  List<Widget> _getWidget() {
    List<Widget> widgets = List();
    // 顶部结算信息
    widgets.add(Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "订单金额",
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                fontFamily: "苹方-简 中黑体",
              ),
            ),
          ),
          Text(
//            "￥447474",
            "￥${_data?.data?.orderAmt ?? 447474}",
            style: TextStyle(
              color: Color(0xFF1C1717),
              fontSize: 18,
              fontFamily: "苹方-简 中黑体",
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    ));
    // 分隔线
    widgets.add(Container(
      height: 5,
      color: Color(0xFFEEEEEE),
    ));
    var channels = _data?.data?.payChannels;
    if (channels != null) {
      for (PayChannelDataPayChannel channel in channels) {
        widgets.add(Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: <Widget>[
              Image.asset("images/kzp.png"),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${channel.channelName}",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '双11最高可减800元',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: Text(
                  "点击“去支付”可选择分期",
                  style: TextStyle(
                    color: Color(0xFFF64F2F),
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              RoundCheckBox(
                value: channel.isDefault == "1",
                colorCheck: Color(0xFFF94D41),
                onChanged: (b) => {channel.isDefault = "1", setState(() {})},
              ),
            ],
          ),
          height: 61.5,
        ));
      }
    }
    return widgets;
  }

  void onBackPressed() {
    print("点击收银台返回");
    Navigator.pop(context);
  }

  onCommit() {
    print("点击支付 $_select");
    Toast.show(context, "点击支付 $_select");
  }
}