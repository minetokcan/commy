import 'package:commy/screens/home_page.dart';
import 'package:commy/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: Get.width * 0.5,
                ),
              ),
            ),
            LoginButton(
              image: "google",
              splashColor: Colors.blue,
              onPressed: () => Get.to(const HomePage()),
              buttonText: "continue_with_google".tr,
              textColor: Colors.white,
              color: Colors.black,
            ),
            // const SizedBox(height: 16),
            // LoginButton(
            //   iconData: Iconsax.sms,
            //   iconColor: CColors.subtitleColor,
            //   onPressed: () => Get.to(() => const EmailPage()),
            //   buttonText: "continue_with_email".tr,
            //   textColor: CColors.subtitleColor,
            //   color: CColors.foregroundBlack,
            // ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ));
  }
}
