import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commy/controllers/auth_controller.dart';
import 'package:commy/models/comment.dart';
import 'package:commy/models/product.dart';
import 'package:commy/utils/helper.dart';

class ProductApi {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<ProductModel?> getProduct(String barcode) async {
    try {
      final results = await firestore.collection("products").doc(barcode).get();

      return ProductModel.fromMap(results.data()!);
    } on FirebaseException catch (err) {
      Helper.showError("Error", err.code);
      return null;
    } catch (err) {
      Helper.showError("Error", "Product could not be found !");
      return null;
    }
  }

  static Future<List<CommentModel>> getComments(String barcode) async {
    try {
      final results = await firestore
          .collection("products")
          .doc(barcode)
          .collection("comments")
          .orderBy("date", descending: true)
          .get();

      return results.docs.map((e) => CommentModel.fromMap(e.data())).toList();
    } on FirebaseException catch (err) {
      Helper.showError("Error", err.code);
      return [];
    } catch (err) {
      Helper.showError("Error", err.toString());
      return [];
    }
  }

  static Future<CommentModel?> addComment(String txt, String barcode) async {
    try {
      final result = firestore.collection("products").doc(barcode).collection("comments").doc();

      final model = CommentModel(
          comment: txt,
          email: AuthController.to.user.value?.email ?? "unknown",
          date: DateTime.now());

      await result.set(
        model.toMap(),
      );

      return model;
    } on FirebaseException catch (err) {
      Helper.showError("Error", err.code);
      return null;
    } catch (err) {
      Helper.showError("Error", err.toString());
      return null;
    }
  }
}
