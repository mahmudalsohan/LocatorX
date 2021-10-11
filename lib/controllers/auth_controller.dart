import 'package:get/get.dart';
import 'package:locator_x/screens/authentication/auth.dart';
import 'package:locator_x/screens/home/home.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
    _setInitialScreen();
  }

  _setInitialScreen() {
    if (!isLoggedIn.value) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }
}
