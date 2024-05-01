import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/widgets/item_card.dart';

class HomeController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  List<List<Widget>> getCategory() {
    const List<Widget> item = <Widget>[
      ItemCard(),
      ItemCard(),
      ItemCard(),
      ItemCard(),
      ItemCard(),
      ItemCard(),
      ItemCard(),
      ItemCard(),
    ];
    List<List<Widget>> category = [item, item, item, item];
    // category has: Child, name

    return category;
  }
}
