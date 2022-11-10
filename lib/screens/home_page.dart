import 'package:commy/controllers/auth_controller.dart';
import 'package:commy/controllers/home_controller.dart';
import 'package:commy/services/product_api.dart';
import 'package:commy/theme.dart';
import 'package:commy/utils/helper.dart';
import 'package:commy/widgets/add_comment.dart';
import 'package:commy/widgets/circle_button.dart';
import 'package:commy/widgets/confirm_button.dart';
import 'package:commy/widgets/custom_inkwell.dart';
import 'package:commy/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(AuthController.to.user.value?.email ?? "Please Login")),
        backgroundColor: CColors.mainColor,
        actions: [
          IconButton(
              onPressed: () {
                AuthController.to.signOut();
              },
              icon: const Icon(Ionicons.exit_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Obx(() => ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          controller: controller.barcodController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.barcodController.clear();
                            },
                            icon: const Icon(Ionicons.close),
                          ),
                          keyboardType: TextInputType.number,
                          inputLabelText: "Barcode Number",
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomCircleIconButton(
                        onTap: controller.scan,
                        icon: const Icon(
                          Ionicons.scan,
                          color: CColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ConfirmButton(
                    onPressed: controller.find,
                    icon: const Icon(Ionicons.search),
                    child: const Text("Search"),
                  ),
                  const SizedBox(height: 32),
                  Obx(() => controller.product.value != null
                      ? Card(
                          child: ListTile(
                            leading: Image.network(controller.product.value!.image),
                            title: Text(controller.product.value!.name),
                            subtitle: Text(controller.product.value!.barcodeNumber),
                          ),
                        )
                      : const Text("Could not find any product !")),
                  ...controller.comments.map((e) => Card(
                        child: ListTile(
                          leading: const Icon(Ionicons.person),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text(
                                e.email.split("@").first,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              Flexible(child: Text(e.date.toString().split(" ").first))
                            ],
                          ),
                          minLeadingWidth: 0,
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(e.comment),
                          ),
                        ),
                      )),
                  Obx(() => controller.product.value != null
                      ? CustomInkWell(
                          onTap: () async {
                            final result = await AddComment.open();
                            if (result != null) {
                              final model = await ProductApi.addComment(
                                  result, controller.product.value!.barcodeNumber);
                              if (model != null) {
                                controller.comments.insert(0, model);
                                Helper.showToast("Comment added successfuly :)");
                              } else {
                                Helper.showError("Error", "Comment could not be added !");
                              }
                            }
                          },
                          child: const Card(
                            child: SizedBox(
                              height: 64,
                              child: Center(child: Text("+ Add Comment")),
                            ),
                          ),
                        )
                      : const SizedBox())
                ],
              )),
        ),
      ),
    );
  }
}
