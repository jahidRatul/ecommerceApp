import 'package:ecommerce_app/screen/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcommerceApp',
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
