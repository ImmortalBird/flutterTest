import 'package:cashier/main.dart';
import 'package:flutter/material.dart';
import 'ColorsUtil.dart';
import 'model/HomePageModelDataProducts.dart';
import 'model/ProdectModel.dart';
import 'net/HomePageApi.dart';
import 'model/HomePageModel.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static var item1 = ProdectModel(
    title: '尚纳斯CSP-P663TB 1.5米6位5孔新国标组合孔位插座',
    subTitle: '红蓝色',
    imgurl: 'http://image5.suning.cn/uimg/b2c/newcatentries/0000000000-000000000103794985_3.jpg_400w_400h_4e',
    price: '￥1980.00',
    subPrice: '￥320.00',
  );
  static var item2 = ProdectModel(
    title: '惠普（HP）CC653AA 901号黑色墨盒',
    subTitle: '红蓝色',
    imgurl: 'http://img13.360buyimg.com/n11/jfs/t1603/352/614124739/82216/54629c3d/559a3088N381aba44.jpg',
    price: '￥1980.00',
    subPrice: '￥320.00',
  );
  static var item3 = ProdectModel(
    title: '法国雅漾（Avene）滋润洁肤皂100g（洁面皂 洗面 舒缓敏感洗脸皂 温和清洁 皮尔法伯集团 原装进口）',
    subTitle: '红蓝色',
    imgurl: 'http://img13.360buyimg.com/n11/jfs/t1/76796/38/4961/120846/5d313544E1bf16289/fd2dd5c1acd76b8a.jpg',
    price: '￥1980.00',
    subPrice: '￥320.00',
  );
  List <HomePageModelDataProducts>productList;
  List <HomePageModelDataProducts>minProductList;
  List <HomePageModelDataProducts>maxProductList;
  bool isOpen = true;
  String isOpenStr = '收起';

  HomePageModel modelData; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // HomePageApi api = HomePageApi();
    // DefaultAssetBundle.of(context).loadString("images/HomePageData.json").then((value){
    //   HomePageModel loadModel = api.loadLocalNewFansData(value);
    //   productList = loadModel.data.products;
    //   minProductList = productList.sublist(0,3);
    //   maxProductList = loadModel.data.products;
    //   setState(() {
    //     modelData = loadModel;
    //   });
    // });

    HomePageApi.requestNewFans().then((value) {
      productList = value.data.products;
      minProductList = productList.sublist(0,3);
      maxProductList = value.data.products;
      setState(() {
        modelData = value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('结算中心'),
        elevation: 0.0,
      ),
      backgroundColor: ColorsUtil.hexColor(0xFAFAFA),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,  
                reverse: false,
                padding: EdgeInsets.only(bottom: 89),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    _buildAddressWidget(),
                    _buildProductListWidget(),
                    _buildProductOpenWidget(),
                    _buildProductPriceWidget(),
                  ],
                ),
              ),
              new Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: _buildBottomWidget(),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildAddressWidget() {
    return new Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      height: 95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          this.modelData != null ? this.modelData.data.shippingInfo.name : '',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: ColorsUtil.hexColor(0x262121),
                            fontFamily: "PingFang-SC-Medium",
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            this.modelData != null ? this.modelData.data.shippingInfo.phone : '',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: ColorsUtil.hexColor(0x262121),
                              fontFamily: "PingFang-SC-Heavy",
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          color: ColorsUtil.hexColor(0x262121),
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            '默认',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: ColorsUtil.hexColor(0xFFFFFF),
                              fontFamily: "PingFang-SC-Light",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      this.modelData != null ? this.modelData.data.shippingInfo.provinceName + 
                      this.modelData.data.shippingInfo.cityName + 
                      this.modelData.data.shippingInfo.districtName + 
                      this.modelData.data.shippingInfo.streetName + 
                      this.modelData.data.shippingInfo.address : '',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: ColorsUtil.hexColor(0x666666),
                        fontFamily: "PingFang-SC-Regular",
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 46,
            child: Image.asset(
              'images/address_next.png', 
              width: 16, 
              height: 16, 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductListWidget() {
    return new Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: _buildProductItemWidgetList()
      ),
    );
  }

  List _buildProductItemWidgetList() {
    List <Widget>itemList = [];
    if (productList != null && productList.length > 0) {
      for (var model in productList) {
        itemList.add(_buildProductItemWidget(model));
      }
    }
    return itemList;
  }

  Widget _buildProductItemWidget(HomePageModelDataProducts model) {
    return new Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      height: 120,
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(left: 15),
            child: Image.network(model.imgUrl),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      model.productName,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: ColorsUtil.hexColor(0x262121),
                        fontFamily: "PingFang-SC-Medium",
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      model.specText,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: ColorsUtil.hexColor(0x999999),
                        fontFamily: "PingFang-SC-Regular",
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Container(
                    child: Text(
                      model.productPrice,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: ColorsUtil.hexColor(0x262121),
                        fontFamily: "PingFang-SC-Medium",
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '月供',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: ColorsUtil.hexColor(0x262121),
                              fontFamily: "PingFang-SC-Regular",
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            model.monthAmt,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: ColorsUtil.hexColor(0xF64F2F),
                              fontFamily: "PingFang-SC-Medium",
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '起',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: ColorsUtil.hexColor(0x262121),
                              fontFamily: "PingFang-SC-Regular",
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Container(
                          child: Text(
                          'x' + model.count,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: ColorsUtil.hexColor(0x999999),
                              fontFamily: "PingFang-SC-Regular",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductOpenWidget() {
    return new Container(
      margin: EdgeInsets.only(top: 5),
      height: 44,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          isOpen = !isOpen;
          var currentProductList = isOpen ? maxProductList : minProductList;
          String currentOpenStr = isOpen ? '收起' : '更多';
          setState(() {
            productList = currentProductList;
            isOpenStr = currentOpenStr;
          });
        },
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            isOpenStr, 
            style: TextStyle(
              fontSize: 13.0,
              color: ColorsUtil.hexColor(0x262121),
              fontFamily: "PingFang-SC-Regular",
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductPriceWidget() {
    return new Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 45,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '商品总金额',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ColorsUtil.hexColor(0x262121),
                      fontFamily: "PingFang-SC-Medium",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    this.modelData != null ? '￥' + this.modelData.data.productAmt : '0.00',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: ColorsUtil.hexColor(0x262121),
                      fontFamily: "PingFang-SC-Medium",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: ColorsUtil.hexColor(0xFAFAFA),
          ),
          Container(
            height: 45,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '运费',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ColorsUtil.hexColor(0x262121),
                      fontFamily: "PingFang-SC-Medium",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    this.modelData != null ? '+￥' + this.modelData.data.expressAmt : '0.00',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: ColorsUtil.hexColor(0x262121),
                      fontFamily: "PingFang-SC-Medium",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomWidget() {
    return new Container(
      height: 84,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            padding: EdgeInsets.only(left: 15),
            color: ColorsUtil.hexColor(0xFAF1EF),
            alignment: Alignment.centerLeft,
            child: Text(
              '支付立减￥50',
              style: TextStyle(
                fontSize: 13.0,
                color: ColorsUtil.hexColor(0xF64F2F),
                fontFamily: "PingFang-SC-Regular",
              ),
            ),
          ),
          Container(
            height: 54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8.5, 15, 0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '月供:',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorsUtil.hexColor(0x262121),
                                fontFamily: "PingFang-SC-Regular",
                              ),
                            ),
                            Text(
                              '￥',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorsUtil.hexColor(0xF64F2F),
                                fontFamily: "PingFang-SC-Regular",
                              ),
                            ),
                            Text(
                              this.modelData != null ? this.modelData.data.monthAmt : '0.00',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: ColorsUtil.hexColor(0xF64F2F),
                                fontFamily: "PingFang-SC-Medium",
                              ),
                            ),
                            Text(
                              '起',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorsUtil.hexColor(0x262121),
                                fontFamily: "PingFang-SC-Medium",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 2.5, 15, 0),
                        child: Text(
                          this.modelData != null ? '合计:￥' + this.modelData.data.totalAmt : '0.00',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: ColorsUtil.hexColor(0x666666),
                            fontFamily: "PingFang-SC-Medium",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('跳转一下页面');
                    var appTitle = '收银台';
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: appTitle)));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: ColorsUtil.hexColor(0x262121),
                    height: 54,
                    width: 125,
                    child: Text(
                      '提交订单',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: ColorsUtil.hexColor(0xFFFFFF),
                        fontFamily: "PingFang-SC-Medium",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}