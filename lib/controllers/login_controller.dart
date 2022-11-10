import 'package:commy/controllers/auth_controller.dart';
import 'package:commy/utils/helper.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  Map<String, ValidEditingController> validators = {
    "email": ValidEditingController(
      validFn: (txt) {
        if (!GetUtils.isEmail((txt ?? "").trim())) {
          return "This email address is not valid !";
        }
        return null;
      },
    ),
    "password": ValidEditingController(validFn: (txt) {
      if (!GetUtils.isLengthGreaterOrEqual(txt ?? "", 6)) {
        return "Password must be minimum 6 characters !";
      }
      return null;
    }),
  };

  String? isValid() {
    for (final validator in validators.entries) {
      final err = validator.value.validFn(validator.value.controller.text);
      if (err != null) {
        return err;
      }
    }
    return null;
  }

  final obscureText = true.obs;
  @override
  void onClose() {
    for (final validator in validators.values) {
      validator.controller.dispose();
    }
    super.onClose();
  }

  void logIn() async {
    final err = isValid();
    if (err != null) {
      Helper.showError("Error", err.toString());
    } else {
      AuthController.to.signIn(
        'emailSignIn',
        email: validators["email"]!.controller.text.trim(),
        password: validators["password"]!.controller.text.trim(),
      );
    }
  }
}
