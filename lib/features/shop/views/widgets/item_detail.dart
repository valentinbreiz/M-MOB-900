import 'package:epitech/common/widgets/curve_edges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    required String name,
    required double price,
    super.key,
    int sales = 0,
    String publisher = ' ',
    String description = ' ',
  })  : _description = description,
        _price = price,
        _name = name,
        _publisher = publisher,
        _sales = sales;

  final int _sales;
  final String _name;
  final String _publisher;
  final double _price;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _bottomBar(),
      appBar: AppBar(
        title: Text(_name),
        backgroundColor: Colors.grey[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: <Widget>[
              _buildTop(),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.grey[100],
      height: 70,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
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
              const Text('2'),
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
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return ClipPath(
      clipper: RoundTopCorner(),
      child: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.zero,
        child: Container(
          height: Get.context!.height / 3,
          width: Get.context!.width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: Get.context!.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tee-shirts-express.com%2Fimages%2Fproduits%2F1920%2Fso-01166%2Fso-01166-rose_fluo-1.jpg&f=1&nofb=1&ipt=60003633469fb72540d5ff45a165eb389efc85a57657639b6e3ed4c6c41142f4&ipo=images',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPrice(),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(_name),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(_publisher),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
          const SizedBox(height: 25),
          _buildDescription(),
          const Divider(),
          _buildReview(),
        ],
      ),
    );
  }

  Widget _buildReview() {
    return Container();
    // return ListView.builder(itemBuilder: itemBuilder)
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        ReadMoreText(
          _description,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: <Widget>[
        if (_sales > 0)
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(' -${_sales.toString()}%'),
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '${_price.toString()}€',
            style: _sales > 0
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
        ),
        if (_sales > 0)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${(_price * (_sales / 10)).toString()}€',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
      ],
    );
  }
}
