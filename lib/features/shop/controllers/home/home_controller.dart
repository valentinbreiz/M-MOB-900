import 'package:epitech/features/shop/views/widgets/item_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final RxInt selectedIndex = 0.obs;

  final Rx<Color?> animationColor = Rx<Color>(Colors.blue);

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  List<List<Widget>> getCategory() {
    const List<Widget> item = <Widget>[
      ItemCard(
        name: 'name',
        publisher: 'nike',
        price: 123.5,
      ),
      ItemCard(
        name: 'name',
        price: 123.5,
        sales: 25,
      ),
      ItemCard(
        name: 'name',
        publisher: 'nike',
        price: 123.5,
      ),
      ItemCard(
        name: 'name',
        price: 123.5,
      ),
      ItemCard(
        name: 'name',
        publisher: 'nike',
        price: 123.5,
      ),
      ItemCard(
        name: 'name',
        price: 123.5,
      ),
    ];
    List<List<Widget>> category = [item, item, item, item];
    // category has: Child, name

    return category;
  }
}
