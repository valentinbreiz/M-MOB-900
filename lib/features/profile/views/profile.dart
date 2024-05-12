import 'package:epitech/common/widgets/curve_edges.dart';
import 'package:epitech/common/widgets/list_tile.dart';
import 'package:epitech/features/auth/controllers/user.dart';
import 'package:epitech/features/order/views/order.dart';
import 'package:epitech/features/picture/picture.dart';
import 'package:epitech/features/profile/controllers/profile_controller.dart';
import 'package:epitech/features/profile/views/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final Picture _pictureController = Get.put(Picture());
  final ProfileController _profileController = Get.put(ProfileController());
  final LocalUser _user = Get.put(LocalUser.fromDB());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(
              () => SizedBox(
                width: Get.width,
                child: _user.email!.value != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildTop(),
                          _buildBottom(),
                        ],
                      )
                    : Text(_user.email!.value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Column(
      children: <Widget>[
        NewListTile(
          icon: Icons.home,
          title: 'Address',
          subTitle: 'Change address',
          callback: () async => Get.to(Edit.new),
        ),
        NewListTile(
          icon: Icons.history,
          title: 'My order',
          subTitle: 'Order history',
          callback: () async => Get.to(Order.new),
        ),
        NewListTile(
          icon: Icons.notifications,
          title: 'Notification',
          subTitle: 'Order update and status',
          callback: () {},
        ),
      ],
    );
  }

  Widget _buildTop() {
    return ClipPath(
      clipper: RoundTopCorner(),
      child: Container(
        color: Colors.yellow,
        padding: EdgeInsets.zero,
        child: Container(
          height: Get.context!.height / 5,
          width: Get.context!.width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 35),
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: GestureDetector(
                    onTap: () async => _pictureController.getPicture(),
                    child: ScaleTransition(
                      scale: _profileController.tween.animate(
                        CurvedAnimation(
                          parent: _profileController.animationController,
                          curve: Curves.elasticOut,
                        ),
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(180),
                          color: Colors.grey[500],
                          image: _pictureController.img.value != null
                              ? DecorationImage(
                                  image:
                                      FileImage(_pictureController.img.value!),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${_user.firstName?.value} ${_user.lastName?.value}',
                  ),
                  subtitle: Text(_user.email!.value),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.edit_note,
                      size: 28,
                    ),
                    onPressed: () async => Get.to(Edit.new),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
