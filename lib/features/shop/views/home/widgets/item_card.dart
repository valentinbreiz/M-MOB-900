import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidth =
        Get.context!.width / 2 > 350 ? 350 : Get.context!.width / 2;
    return PaddedContainer(
      child: Container(
        constraints: BoxConstraints(minWidth: 180, maxWidth: maxWidth),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            const Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Text("Product name"),
                    Text("Product mark"),
                    Text("Product Price")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Flexible(
      flex: 2,
      child: Stack(
        children: [
          Image.network(
            // to be replaced
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ebayimg.com%2Fimages%2Fg%2FUusAAOSwVnll9dKY%2Fs-l500.jpg&f=1&nofb=1&ipt=499fcc5c0b432f3ce559cfd9950335a7538ee5728ee7ec86396bc61ce642ea54&ipo=images",
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow,
            ),
            child: const Text("-25%"),
          )
        ],
      ),
    );
  }
}

class PaddedContainer extends StatelessWidget {
  const PaddedContainer({super.key, required Widget child}) : _child = child;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        child: _child);
  }
}
