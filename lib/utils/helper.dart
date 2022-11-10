import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Helper {
  static double lerp(double a, double b, double t) => a + (b - a) * t;

  static double inverseLerp(double a, double b, double v) => (v - a) / (b - a);

  static double remap(double v, double a, double b, double c, double d) =>
      lerp(c, d, inverseLerp(a, b, v));

  static bool hasController<T>() {
    try {
      Get.find<T>();
      return true;
    } catch (_) {
      return false;
    }
  }

  static void showToast(String text) =>
      EasyLoading.showToast(text, toastPosition: EasyLoadingToastPosition.bottom);

  static bool hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0, double maxWidth = double.infinity, int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  static DateTime utcToLocal(String val) => DateTime.parse(val).toLocal();
  static String localToUtc(DateTime date) => date.toUtc().toIso8601String();

  static Future<void> showError(String title, String msg) async {
    EasyLoading.showToast(msg, toastPosition: EasyLoadingToastPosition.bottom);
  }

  static Future<void> showSuccess(String msg) async {
    return await EasyLoading.showSuccess(
      msg,
      dismissOnTap: true,
      duration: const Duration(seconds: 3),
      maskType: EasyLoadingMaskType.black,
    );
  }

  static Duration secondsToDuration(int seconds) => Duration(seconds: seconds);

  static String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  static String generateNonceNumber([int length = 32]) {
    const charset = '0123456789';
    final random = Random();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  static double get getShimmerWidth =>
      min(Random().nextInt((Get.width * 0.7).toInt()).toDouble() + Get.width * 0.3, Get.width);
}

class ValidEditingController {
  TextEditingController controller;
  String? Function(String? txt) validFn;
  String initialValue;
  ValidEditingController({
    required this.validFn,
    this.initialValue = "",
  }) : controller = TextEditingController(text: initialValue);

  void dispose() => controller.dispose();
}
