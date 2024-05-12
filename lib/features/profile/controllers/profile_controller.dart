import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final Tween<double> tween = Tween(begin: 0.75, end: 2);

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
    animationController.repeat(reverse: true);
  }
}
