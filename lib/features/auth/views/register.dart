import 'package:epitech/features/auth/controllers/register_controller.dart';
import 'package:epitech/features/auth/views/form_field.dart';
import 'package:epitech/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final controller = Get.put(RegisterController());

  double calcPadding() {
    ScreenSize size = getScreenSize(Get.context!);

    if (size == ScreenSize.small || size == ScreenSize.normal) {
      return 20;
    }
    return 150;
  }

  double calcVerticalPadding() {
    ScreenSize size = getScreenSize(Get.context!);

    if (size == ScreenSize.small || size == ScreenSize.normal) {
      return 30;
    }
    return 40;
  }

  static const double verticalPadding = 30;

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = calcPadding();
    // double verticalPadding = calcVerticalPadding();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Obx(
              () => Column(
                children: <Widget>[
                  const SizedBox(height: 100),
                  Text(
                    controller.error.value == '' ? '' : controller.error.value,
                    style: TextStyle(color: Colors.red),
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: verticalPadding),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MyFormField(
                          title: 'First name',
                          controller: controller.firstNameController,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: MyFormField(
                          title: 'Last name',
                          controller: controller.lastNameController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: verticalPadding),
                  MyFormField(
                    title: 'Email',
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: verticalPadding),
                  MyFormField(
                    title: 'Phone number',
                    controller: controller.phoneNbrController,
                  ),
                  const SizedBox(height: verticalPadding),
                  _buildPassword(),
                  const SizedBox(height: verticalPadding),
                  SizedBox(
                    width: Get.width > ScreenSize.normal.size
                        ? Get.width / 2
                        : Get.width / 4,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await controller.register()) {
                          await Get.toNamed('/home');
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                  const SizedBox(height: verticalPadding),
                  SizedBox(
                    width: Get.width > ScreenSize.normal.size
                        ? Get.width / 2
                        : Get.width / 4,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () async {
                        await Get.toNamed('/login');
                      },
                      child: const Text('Log in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: controller.passwordController,
          obscureText: controller.hidePass.value,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () =>
                  controller.hidePass.value = !controller.hidePass.value,
              child: controller.hidePass.value
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            labelText: 'Password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: verticalPadding),
        TextFormField(
          controller: controller.confirmPasswordController,
          obscureText: controller.hideConfirmPass.value,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => controller.hideConfirmPass.value =
                  !controller.hideConfirmPass.value,
              child: controller.hideConfirmPass.value
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            labelText: 'Confirm password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
