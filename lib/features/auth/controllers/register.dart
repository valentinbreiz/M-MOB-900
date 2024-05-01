import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString error = "".obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<bool> register() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      passwordController.clear();
      emailController.clear();
      confirmPasswordController.clear();
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
