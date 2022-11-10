import 'dart:async';

import 'package:commy/utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final user = Rxn<User>();

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    ever(user, (_) async {
      if (user.value == null) {
        return;
      }
      EasyLoading.dismiss();
    });

    super.onInit();
  }

  Future<void> signIn(
    String platform, {
    String? email,
    String? password,
  }) async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.clear);
      switch (platform) {
        case "google":
          await signInWithGoogle();
          break;
        case "emailSignIn":
          await signInWithEmail(email!, password!);
          break;
        default:
          Helper.showError(
            "Not Implemented Yet",
            '${platform.toUpperCase()} sign in is not implemented yet.',
          );
          EasyLoading.dismiss();
          break;
      }
    } catch (err) {
      debugPrint(err.toString());
      EasyLoading.dismiss();
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      Helper.showError("Error", err.toString());
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (err) {
      if (err.code != "unknown") Helper.showError("Error", err.toString());

      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      try {
        await GoogleSignIn().disconnect();
      } catch (_) {}
      await _auth.signOut();
    } catch (err) {
      debugPrint("Signout error : $err");
    }
    // GlobalBindings.resetProfileControllers(isLogin: false);
    EasyLoading.dismiss();
  }
}
