import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'cashier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appTitle = '收银台';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // home: MyHomePage(title: appTitle),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MyHttpClient();
  }


}
