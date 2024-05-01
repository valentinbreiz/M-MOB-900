import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString error = "".obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Fluttertoast flutterToast = Fluttertoast();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<bool> login() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      passwordController.clear();
      emailController.clear();
      return true;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        error.value = 'No user found with email';
      }
      if (err.code == 'wrong-password') {
        error.value = 'wrong password';
      }
      return false;
    }
  }
}
