import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:commy/const.dart';
import 'package:commy/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final barcodController = TextEditingController();
  final comments = <ProductModel>[].obs;

  void find() {
    final result = Const.comments
        .where((e) => e.barcodNumber == barcodController.text.trim())
        .toList();
    comments.value = result;
  }

  void scan() async {
    var result = await BarcodeScanner.scan();
    barcodController.text = result.rawContent;
  }
}
