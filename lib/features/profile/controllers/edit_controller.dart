import 'package:epitech/features/auth/controllers/user.dart';
import 'package:epitech/features/db/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;

  final LocalUser user = Get.put(LocalUser.fromDB());

  /// Text field Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNbrController = TextEditingController();

  final TextEditingController adressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  final UserRepository userRepository = Get.put(UserRepository());

  Future<void> updateData() async {
    final LocalUser newUser = LocalUser(
      id: currentUser!.uid.obs,
      pwd: user.pwd,
      email: emailController.text.trim().obs,
      firstName: firstNameController.text.trim().obs,
      lastName: lastNameController.text.trim().obs,
      phoneNbr: phoneNbrController.text.trim().obs,
      profilePic: ''.obs,
    );

    await userRepository.updateData(newUser);
  }
}
