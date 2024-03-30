import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_size.dart';
import '../controllers/register.dart';
import 'form_field.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    double calcPadding() {
      ScreenSize size = getScreenSize(context);

      if (size == ScreenSize.small || size == ScreenSize.normal) {
        return 20;
      }
      return 150;
    }

    double calcVerticalPadding() {
      ScreenSize size = getScreenSize(context);

      if (size == ScreenSize.small || size == ScreenSize.normal) {
        return 30;
      }
      return 40;
    }

    double horizontalPadding = calcPadding();
    double verticalPadding = calcVerticalPadding();

    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Column(children: <Widget>[
                        const SizedBox(height: 100),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: verticalPadding),
                        const MyFormField(title: 'Email'),
                        SizedBox(height: verticalPadding),
                        const MyFormField(
                          title: 'Password',
                          sufIcon: Icons.remove_red_eye,
                          // Icons.visibility_off,
                        ),
                        SizedBox(height: verticalPadding),
                        const MyFormField(
                          title: 'Confirm password',
                          sufIcon: Icons.remove_red_eye,
                          // Icons.visibility_off,
                        ),
                        SizedBox(height: verticalPadding),
                        SizedBox(
                          width: Get.width > ScreenSize.normal.size
                              ? Get.width / 2
                              : Get.width / 4,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.register();
                              Get.toNamed('/home');
                            },
                            child: const Text('Register'),
                          ),
                        ),
                        SizedBox(height: verticalPadding),
                        SizedBox(
                          width: Get.width > ScreenSize.normal.size
                              ? Get.width / 2
                              : Get.width / 4,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            child: const Text('Log in'),
                          ),
                        ),
                      ]),
                    )))));
  }
}
