import 'package:flutter/material.dart';
import 'package:hungrazy/pages/home_page.dart';
import 'package:hungrazy/pages/order_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungrazy',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes:{
        '/' : (context) => HomePage(),
        '/order' : (context) => OrderPage(),
      },
    );
  }
}
