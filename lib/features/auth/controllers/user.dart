import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epitech/features/db/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LocalUser extends GetxController {
  LocalUser({
    this.id,
    this.pwd,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNbr,
    this.profilePic,
  });

  LocalUser.fromDB() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (firebaseAuth.currentUser != null) {
      _getData(firebaseAuth);
    }
  }

  RxString? id = RxString('');
  RxString? pwd = RxString('');
  RxString? email = RxString('');
  RxString? firstName = RxString('');
  RxString? lastName = RxString('');
  RxString? phoneNbr = RxString('');
  RxString? profilePic = RxString('');
  final UserRepository userRepository = Get.put(UserRepository());

  Future<void> _getData(FirebaseAuth firebaseAuth) async {
    final DocumentSnapshot<Map<String, dynamic>> userData =
        await userRepository.loginUser(firebaseAuth.currentUser!.uid);
    id!.value = userData.id;
    userData.toString();
    pwd!.value = userData['password'];
    email!.value = userData['email'];
    firstName!.value = userData['firstName'];
    lastName!.value = userData['lastName'];
    phoneNbr!.value = userData['phoneNbr'];
    profilePic!.value = userData['profilePic'];
  }

  Map<String, dynamic> toJson() => <String, String>{
        'id': id!.value,
        'password': pwd!.value,
        'email': email!.value,
        'firstName': firstName!.value,
        'lastName': lastName!.value,
        'phoneNbr': phoneNbr!.value,
        'profilePic': profilePic!.value,
      };
}
