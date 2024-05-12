import 'package:epitech/features/checkout/views/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

//   List Item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomSheet: _buildBottomBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) => Row(
                  children: <Widget>[
                    const SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'publisher',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildAmountSelector(),
                            const Text('125€'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 35),
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Colors.white,
      height: 70,
      padding: const EdgeInsets.all(8),
      width: Get.width,
      child: ElevatedButton(
        onPressed: () async {
          await Get.to(Checkout.new);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: const Text('Checkout x€'),
      ),
    );
  }

  Widget _buildAmountSelector() {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            color: Colors.black,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.grey[300],
            ),
          ),
        ),
        const Text(
          '2',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            color: Colors.black,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              color: Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }
}
