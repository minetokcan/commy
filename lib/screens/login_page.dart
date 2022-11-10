import 'package:commy/controllers/auth_controller.dart';
import 'package:commy/controllers/login_controller.dart';
import 'package:commy/theme.dart';
import 'package:commy/widgets/confirm_button.dart';
import 'package:commy/widgets/login_button.dart';
import 'package:commy/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 32),
              Text("Login Account", style: Styles.bigTitle),
              Column(
                children: [
                  const SizedBox(height: 32),
                  CustomTextField(
                    validator: loginController.validators["email"]!.validFn,
                    controller: loginController.validators["email"]!.controller,
                    inputLabelText: "Email",
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomTextField(
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginController.obscureText.value = !loginController.obscureText.value;
                        },
                        icon: loginController.obscureText.value
                            ? const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Ionicons.eye_off,
                                  color: CColors.subtitleColor,
                                  size: 16,
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Ionicons.eye,
                                  color: CColors.subtitleColor,
                                  size: 16,
                                ),
                              ),
                      ),
                      obscureText: loginController.obscureText.value,
                      validator: loginController.validators["password"]!.validFn,
                      controller: loginController.validators["password"]!.controller,
                      inputLabelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConfirmButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      loginController.logIn();
                    },
                    child: Text(
                      "Login",
                      style: Styles.bigTitle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(child: Divider(color: CColors.textColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR", style: Styles.subtitle),
                    ),
                    const Flexible(child: Divider(color: CColors.textColor)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  LoginButton(
                    image: "google",
                    splashColor: CColors.mainColor,
                    onPressed: () => controller.signIn('google'),
                    buttonText: "Continue with Google",
                    textColor: CColors.backgroundcolor,
                    color: CColors.white,
                  ),
                  const SizedBox(height: 16),
                  LoginButton(
                    image: "linkedin",
                    splashColor: CColors.mainColor,
                    onPressed: () => controller.signIn('linkedin'),
                    buttonText: "Continue with LinkedIn",
                    textColor: CColors.backgroundcolor,
                    color: CColors.white,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
