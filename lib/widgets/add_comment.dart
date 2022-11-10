import 'package:commy/theme.dart';
import 'package:commy/widgets/custom_inkwell.dart';
import 'package:commy/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();

  static Future<String?> open() => Get.dialog(const AddComment());
}

class _AddCommentState extends State<AddComment> {
  final txtController = TextEditingController();

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: CColors.white,
      elevation: 10,
      title: Text("Add a Comment", style: Styles.bigTitle.copyWith(color: CColors.black)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            controller: txtController,
            inputLabelText: "Comment",
            borderColor: CColors.subtitleColor,
            keyboardType: TextInputType.text,
            autoFocus: true,
            maxLength: 6,
            counter: const SizedBox(),
          )
        ],
      ),
      actions: [
        Row(
          children: [
            Flexible(
              child: CustomInkWell(
                onTap: Get.back,
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CColors.foregroundBlack,
                    border: Border.all(width: 1, color: CColors.subtitleColor),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, color: CColors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: CustomInkWell(
                onTap: () {
                  Get.back(result: txtController.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  decoration: BoxDecoration(
                    color: CColors.mainColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "Complete",
                    style: TextStyle(fontSize: 16, color: CColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
