import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epitech/features/auth/controllers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  final FirebaseAuth _user = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxString error = ''.obs;

  /// Save user to firebase
  Future<void> saveUser(LocalUser user) async {
    try {
      await _db.collection('Users').doc(user.id!.value).set(user.toJson());
    } on FirebaseException catch (err) {
      error.value = err.message!;
    }
  }

  Future<void> updateData(LocalUser user) async {
    try {
      await _db.collection('Users').doc(user.id!.value).update(user.toJson());
    } on FirebaseException catch (err) {
      error.value = err.message!;
    }
  }

  /// Get data from firebase
  Future<DocumentSnapshot<Map<String, dynamic>>> loginUser(
      String userId) async {
    try {
      return await _db.collection('Users').doc(userId).get();
    } on FirebaseException catch (err) {
      error.value = err.message!;
    }
    return Future.error('user not found');
  }

  /// Save picture (not working - billing account not getting created)
  Future<void> saveProfilePic(File picture, String imgName) async {
    try {
      if (_user.currentUser == null) return;
      final Reference ref = FirebaseStorage.instance.ref().child(imgName);
      await ref.putFile(picture);
      await _db
          .collection('Users')
          .doc(_user.currentUser!.uid)
          .set({'image': imgName});
    } on FirebaseException catch (err) {
      error.value = err.message!;
    }
  }
}
