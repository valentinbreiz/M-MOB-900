import 'package:epitech/common/widgets/body_text.dart';
import 'package:epitech/features/auth/controllers/login_controller.dart';
import 'package:epitech/features/auth/views/form_field.dart';
import 'package:epitech/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final controller = Get.put(LoginController());

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
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Obx(
                () => Column(
                  children: <Widget>[
                    const SizedBox(height: 100),
                    if (controller.error.value.isNotEmpty)
                      BodyText(text: controller.error.value, color: Colors.red),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: verticalPadding),
                    MyFormField(
                      title: 'Email',
                      controller: controller.emailController,
                    ),
                    SizedBox(height: verticalPadding),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.hidePass.value,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => controller.hidePass.value =
                              !controller.hidePass.value,
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
                    SizedBox(height: verticalPadding),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?'),
                    ),
                    SizedBox(height: verticalPadding),
                    SizedBox(
                      width: Get.width > ScreenSize.normal.size
                          ? Get.width / 2
                          : Get.width / 4,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (await controller.login()) {
                            Get.toNamed('/home');
                          }
                        },
                        child: const Text('Login'),
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
                          Get.toNamed('/register');
                        },
                        child: const Text('Sign up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
