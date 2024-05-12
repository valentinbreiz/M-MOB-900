import 'package:epitech/common/widgets/header_text.dart';
import 'package:epitech/common/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text('My order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem() {
    return Column(
      children: <Widget>[
        RoundedContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.local_shipping),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText(text: 'Processing', color: Colors.blue),
                        HeaderText(text: 'Order date'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.local_offer),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HeaderText(
                              text: 'Shipping date',
                              color: Colors.blue,
                            ),
                            HeaderText(text: 'Date'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HeaderText(text: 'Processing', color: Colors.blue),
                            HeaderText(text: 'Order date'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
