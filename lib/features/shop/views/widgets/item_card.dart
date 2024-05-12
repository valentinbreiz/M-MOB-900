import 'package:epitech/features/shop/controllers/widget/item.dart';
import 'package:epitech/features/shop/views/widgets/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.name,
    required this.price,
    super.key,
    this.sales = 0,
    this.publisher = ' ',
    this.img = ' ',
  });

  final int sales;
  final String name;
  final String publisher;
  final double price;
  final String img;

  @override
  Widget build(BuildContext context) {
    // final ItemController itemController = Get.put(ItemController(name, price));

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () async {
          await Get.to(
            () => ItemDetail(
              sales: sales,
              name: name,
              publisher: publisher,
              price: price,
              // itemController: itemController,
            ),
          );
        },
        child: Container(
          // constraints: BoxConstraints(minWidth: 180, maxWidth: maxWidth),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade100,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: _buildCard(),
        ),
      ),
    );
  }

  Widget _buildCardBottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            publisher,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$price €',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: SizedBox(
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCardTop(),
        _buildCardBottom(),
      ],
    );
  }

  Widget _buildSales() {
    if (sales <= 0) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: Text('-$sales%'),
    );
  }

  Widget _buildCardTop() {
    return Stack(
      children: <Widget>[
        Image.network(
          img,
          fit: BoxFit.fitWidth,
        ),
        _buildSales(),
      ],
    );
  }
}
