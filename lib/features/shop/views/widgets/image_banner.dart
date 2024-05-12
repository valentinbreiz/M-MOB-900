import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({required this.img, super.key, this.isNetworkImg = false});

  final String img;
  final bool isNetworkImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        width: Get.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15), child: _getImg()),
      ),
    );
  }

  Widget _getImg() {
    if (isNetworkImg) {
      return Image.network(img);
    } else {
      return Image(image: AssetImage(img));
    }
  }
}
