import 'package:flutter/material.dart';
import 'package:getx_exmple/details.dart';
import 'package:getx_exmple/homepage.dart';
import 'package:get/get.dart';
import 'package:getx_exmple/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'GetX',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      getPages: [
        GetPage(name: '/home', page: () => const MyHomePage(title: '',)),
        GetPage(name: '/details', page: () => const Details()),
        // GetPage(name: '/', page: () =>  login()),
      ],
    );
  }
}
