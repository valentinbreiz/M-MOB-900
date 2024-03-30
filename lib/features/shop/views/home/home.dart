import 'package:epitech/common/widgets/curve_edges.dart';
import 'package:epitech/features/shop/controllers/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      drawer: navBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Column(
            children: [
              recommendation(),
              buildCategory(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget navBar() {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0),
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.search, label: 'Search'),
      ],
    );
  }

  Widget recommendation() {
    return ClipPath(
      clipper: RoundTopCorner(),
      child: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: Get.context!.height / 3,
          width: Get.context!.width,
          child: const Text("Top"),
        ),
      ),
    );
  }

  Widget buildCategoryChild(List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: const Text("Category name"),
        ),
        SizedBox(
          height: Get.context!.height / 3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget buildCategory(BuildContext context) {
    List<List<Widget>> category = homeController.getCategory();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCategoryChild(category[index]);
      },
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
