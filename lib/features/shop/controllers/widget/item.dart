import 'package:get/get.dart';

class ItemController extends GetxController {
  ItemController(this.name, this.price);

  int? sales;
  String? publisher;
  String? desc;
  final String name;
  final double price;
}
