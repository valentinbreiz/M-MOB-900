import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/widgets/item_card.dart';

class HomeController extends GetxController {
  bool login() {
    return true;
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
