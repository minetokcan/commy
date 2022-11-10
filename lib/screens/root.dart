import 'package:commy/controllers/auth_controller.dart';
import 'package:commy/screens/home_page.dart';
import 'package:commy/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootWrapper extends StatelessWidget {
  const RootWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return StreamBuilder(
      initialData: controller.user,
      stream: controller.user.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //EasyLoading.dismiss();
          return const HomePage();
        } else if (snapshot.hasError) {
          debugPrint("FIREBASE ERROR : ${snapshot.error}");
        }
        return const LoginPage();
      },
    );
  }
}
