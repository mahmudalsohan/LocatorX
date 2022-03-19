import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locator_x/constants/asset_path.dart';
import 'package:locator_x/controllers/app_controller.dart';
import 'package:locator_x/screens/authentication/widgets/bottom_text.dart';
import 'package:locator_x/screens/authentication/widgets/login.dart';
import 'package:locator_x/screens/authentication/widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  bg3,
                  width: double.infinity,
                  height: Get.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.width / 1.3),
                    SizedBox(height: Get.width / 70),
                    Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: const LoginWidget(),
                    ),
                    Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: const RegistrationWidget(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDisplayedAuthWidget();
                        },
                        text1: "Don't have an account?",
                        text2: "Create account!",
                      ),
                    ),
                    Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDisplayedAuthWidget();
                        },
                        text1: "Already have an account?",
                        text2: "Sign in!!",
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: Get.height / 6,
                  left: 20,
                  child: Image.asset(
                    logo2,
                    width: 140,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
