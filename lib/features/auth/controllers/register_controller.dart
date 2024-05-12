import 'package:epitech/features/auth/controllers/user.dart';
import 'package:epitech/features/db/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString error = "".obs;

  /// Text field Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNbrController = TextEditingController();

  final UserRepository userRepository = Get.put(UserRepository());

  RxBool hidePass = true.obs;
  RxBool hideConfirmPass = true.obs;

  void _clearTextController() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNbrController.clear();
  }

  /// Register user into firebase
  Future<bool> register() async {
    try {
      final UserCredential cred =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final LocalUser newUser = LocalUser(
        id: cred.user!.uid.obs,
        pwd: passwordController.text.trim().obs,
        email: emailController.text.trim().obs,
        firstName: firstNameController.text.trim().obs,
        lastName: lastNameController.text.trim().obs,
        phoneNbr: phoneNbrController.text.trim().obs,
        profilePic: ''.obs,
      );

      await userRepository.saveUser(newUser);
      Get.put(newUser, permanent: true);
      _clearTextController();
      return true;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        error.value = 'The provided password is too weak.';
      } else if (err.code == 'email-already-in-use') {
        error.value = 'The account already exists for that email.';
      }
      return false;
    }
  }
}
