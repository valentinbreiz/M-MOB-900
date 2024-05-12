import 'package:epitech/common/widgets/curve_edges.dart';
import 'package:epitech/features/profile/views/profile.dart';
import 'package:epitech/features/shop/controllers/home/home_controller.dart';
import 'package:epitech/features/shop/views/home/cart.dart';
import 'package:epitech/features/shop/views/widgets/image_banner.dart';
import 'package:epitech/features/shop/views/widgets/search_bar.dart'
    as search_bar;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx(_getScreen),
      floatingActionButton: _cartButton(),
    );
  }

  Widget _getScreen() {
    final List<Widget> screen = <Widget>[
      _homeScreen(),
      Container(),
      Container(),
      Profile(),
    ];
    return screen[_homeController.selectedIndex.value];
  }

  Widget _cartButton() {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(2, -2.5),
        children: <Widget>[
          FloatingActionButton(
            onPressed: () async => await Get.to(Cart.new),
            child: const Icon(Icons.shopping_cart),
          ),
          Obx(
            () => TweenAnimationBuilder<Color?>(
              builder: (BuildContext context, Color? value, Widget? child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                  child: child,
                );
              },
              tween: ColorTween(
                begin: Colors.deepPurpleAccent,
                end: _homeController.animationColor.value,
              ),
              onEnd: () => <ColorSwatch<int>>{
                if (_homeController.animationColor.value != Colors.blue)
                  _homeController.animationColor.value = Colors.blue
                else
                  _homeController.animationColor.value = Colors.deepPurpleAccent
              },
              duration: const Duration(seconds: 2),
              child: Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.black.withAlpha(50),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue, // This would be color of the Badge
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeScreen() {
    return SingleChildScrollView(
      child: SizedBox(
        width: Get.width,
        child: Column(
          children: <Widget>[
            _buildBottom(),
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return ClipPath(
      clipper: RoundTopCorner(),
      child: Container(
        color: Colors.yellow,
        padding: EdgeInsets.zero,
        child: Container(
          height: Get.context!.height / 3,
          width: Get.context!.width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              const search_bar.SearchBar(text: 'Search in store'),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      await Get.toNamed('/login');
                    },
                    child: const Text('login'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _homeController.signOut();
                      await Get.toNamed('/login');
                    },
                    child: const Text('sign-out'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChild(List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: const Text('Category name'),
        ),
        SizedBox(
          height: Get.context!.height / 3,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Get.width ~/ 200,
              mainAxisExtent: 255,
            ),
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildCategory() {
    final List<List<Widget>> category = _homeController.getCategory();

    return Column(
      children: <Widget>[
        const ImageBanner(
          img:
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallup.net%2Fwp-content%2Fuploads%2F2017%2F11%2F23%2F436366-ultra-wide-photography.jpg&f=1&nofb=1&ipt=325ce39a472d8d331c8120f7e706aefa6fdbe1ed91913e55584037b0054377d0&ipo=images',
          isNetworkImg: true,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCategoryChild(category[index]);
          },
        ),
      ],
    );
  }

  Obx _bottomBar() {
    return Obx(
      () => NavigationBar(
        selectedIndex: _homeController.selectedIndex.value,
        onDestinationSelected: (int index) =>
            _homeController.selectedIndex.value = index,
        // type: BottomNavigationBarType.fixed,
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
