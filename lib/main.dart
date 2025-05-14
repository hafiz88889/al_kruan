import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaz_salat/core/utils/route.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Namaz",
      initialRoute: RouteHelper.homePage,
      routes: RouteHelper.getRoute(),
    );
  }
}
