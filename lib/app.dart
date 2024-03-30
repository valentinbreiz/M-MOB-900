import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/views/login.dart';
import 'features/auth/views/register.dart';
import 'features/shop/views/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'EpiShop',
        theme: null,
        home: Home(),
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => Home(),
          ),
          GetPage(
            name: '/login',
            page: () => Login(),
          ),
          GetPage(
            name: '/register',
            page: () => Register(),
          ),
          // GetPage(
          //   name: '/cart',
          //   page: () => const Cart(),
          // ),
          // GetPage(
          //   name: '/checkout',
          //   page: () => const Checkout(),
          // ),
          // GetPage(
          //   name: '/product',
          //   page: () => const Product(),
          // ),
          // GetPage(
          //   name: '/order',
          //   page: () => const Order(),
          // ),
          // GetPage(
          //   name: '/profile',
          //   page: () => const Profile(),
          // ),
        ]);
  }
}
