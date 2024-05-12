import 'package:epitech/features/auth/views/login.dart';
import 'package:epitech/features/auth/views/register.dart';
import 'package:epitech/features/shop/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EpiShop',
      home: Home(),
      initialRoute: '/login',
      getPages: <GetPage>[
        GetPage(
          name: '/home',
          page: Home.new,
        ),
        GetPage(
          name: '/login',
          page: Login.new,
        ),
        GetPage(
          name: '/register',
          page: Register.new,
        ),
      ],
    );
  }
}
