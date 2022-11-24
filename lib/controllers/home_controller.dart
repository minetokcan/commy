import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:commy/models/comment.dart';
import 'package:commy/models/product.dart';
import 'package:commy/services/product_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final barcodController = TextEditingController();

  final product = Rxn<ProductModel>();
  final comments = <CommentModel>[].obs;

  @override
  void onClose() {
    barcodController.dispose();
    super.onClose();
  }

  void find() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    final barcode = barcodController.text.trim();
    product.value = await ProductApi.getProduct(barcode);
    comments.value = await ProductApi.getComments(barcode);

    if (product.value != null) EasyLoading.dismiss();
  }

  void scan() async {
    var result = await BarcodeScanner.scan(options: const ScanOptions(useCamera: 1));

    final str = result.rawContent;
    if (str.isNotEmpty) {
      barcodController.text = result.rawContent;
    }
  }
}
