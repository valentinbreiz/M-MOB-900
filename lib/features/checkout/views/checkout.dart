import 'package:epitech/common/widgets/body_text.dart';
import 'package:epitech/common/widgets/header_text.dart';
import 'package:epitech/common/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

//   List Item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BodyText(text: 'Cart'),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 70,
        padding: const EdgeInsets.all(8),
        width: Get.width,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          child: BodyText(text: 'Checkout x€'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100]!, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8),
                width: Get.width,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return buildItem();
                  },
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100]!, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8),
                width: Get.width,
                child: Column(
                  children: <Widget>[buildPrice(), buildShippingAddr()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BodyText(text: 'publisher'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: HeaderText(text: 'name'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: BodyText(text: 'qty X'),
              ),
              HeaderText(text: '125€'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildShippingAddr() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HeaderText(text: 'Shipping address'),
            TextButton(
              onPressed: () {},
              child: BodyText(text: 'Change'),
            ),
          ],
        ),
        NewListTile(
          icon: Icons.person,
          title: 'name',
          callback: () {},
        ),
        NewListTile(
          icon: Icons.phone,
          title: '+0123456789',
          callback: () {},
        ),
        NewListTile(
          icon: Icons.home,
          title: 'address',
          callback: () {},
        ),
      ],
    );
  }

  Widget buildPrice() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BodyText(text: 'Subtotal'),
            HeaderText(text: '1234€'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BodyText(text: 'Shipping fee'),
            HeaderText(text: '1234€'),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BodyText(text: 'Total fee'),
            HeaderText(text: '1234€'),
          ],
        ),
      ],
    );
  }
}
