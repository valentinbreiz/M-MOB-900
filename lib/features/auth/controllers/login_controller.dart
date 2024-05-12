import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epitech/features/auth/controllers/user.dart';
import 'package:epitech/features/db/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (firebaseAuth.currentUser != null) {
      _autoLog(firebaseAuth);
    }
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString error = ''.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Fluttertoast flutterToast = Fluttertoast();
  final UserRepository userRepository = Get.put(UserRepository());

  RxBool hidePass = true.obs;

  Future<void> _autoLog(FirebaseAuth firebaseAuth) async {
    final DocumentSnapshot<Map<String, dynamic>> userData =
        await userRepository.loginUser(firebaseAuth.currentUser!.uid);
    Get.put(
      LocalUser(
        id: RxString(userData.id),
        pwd: RxString(userData['password']),
        email: RxString(userData['email']),
        firstName: RxString(userData['firstName']),
        lastName: RxString(userData['lastName']),
        phoneNbr: RxString(userData['phoneNbr']),
        profilePic: RxString(userData['profilePic']),
      ),
    );
    await Get.toNamed('/home');
  }

  Future<bool> login() async {
    try {
      final UserCredential cred = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await userRepository.loginUser(cred.user!.uid);
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
      if (err.code == 'invalid-credential') {
        error.value = 'Wrong email / password combination';
      }
      return false;
    }
  }
}
