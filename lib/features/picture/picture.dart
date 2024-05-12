import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class Picture {
  Rx<File?> img = Rx<File?>(null);

  /// Get picture from camera
  Future<void> getPicture() async {
    final XFile? takenImg =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (takenImg == null) return;
    img.value = File(takenImg.path);
    // await UserRepository().saveProfilePic(img.value!, takenImg.name);
  }
}
