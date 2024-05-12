import 'package:epitech/features/picture/picture.dart';
import 'package:epitech/features/profile/controllers/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Edit extends StatelessWidget {
  Edit({super.key});
  final EditController _editController = Get.put(EditController());
  final Picture _pictureController = Get.put(Picture());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async => _pictureController.getPicture(),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(180),
                                color: Colors.grey[500],
                                image: _pictureController.img.value != null
                                    ? DecorationImage(
                                        image: FileImage(
                                          _pictureController.img.value!,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            const Text('Change profile picture'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                _profileInformation(),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                _personalInfo(),
                const SizedBox(height: 20),
                if (true)
                  SizedBox(
                    width: Get.width / 3,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _editController.updateData();
                        await Fluttertoast.showToast(
                          msg: 'Updated successfully',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16,
                        );
                      },
                      child: const Text('save'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _personalInfo() {
    return Column(
      children: <Widget>[
        const Text(
          'Personal information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: <Widget>[
            _buildDataTile(
              'ID',
              _editController.currentUser!.uid,
              TextEditingController(),
            ),
            _buildDataTile(
              'Email',
              _editController.user.email!.value,
              _editController.emailController,
            ),
            _buildDataTile(
              'Phone number',
              _editController.user.phoneNbr!.value,
              _editController.phoneNbrController,
            ),
            _buildDataTile(
              'Address',
              'no address',
              _editController.adressController,
            ),
            _buildDataTile(
                'State', 'no state', _editController.stateController),
            _buildDataTile(
              'Postal code',
              'no code',
              _editController.postalCodeController,
            ),
          ],
        ),
      ],
    );
  }

  Widget _profileInformation() {
    return Column(
      children: <Widget>[
        const Text(
          'Profile information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: <Widget>[
            _buildDataTile(
              'First name',
              _editController.user.firstName!.value,
              _editController.firstNameController,
            ),
            _buildDataTile(
              'Last name',
              _editController.user.lastName!.value,
              _editController.lastNameController,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDataTile(
    String title,
    String sub,
    TextEditingController controller,
  ) {
    controller.text = sub;

    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (title == 'ID')
          Expanded(
            flex: 2,
            child: Text(
              sub,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        else
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
      ],
    );
  }
}
