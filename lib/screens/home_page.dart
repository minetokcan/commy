import 'package:commy/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller.barcodController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: controller.scan,
              child: const Text("Scan"),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: controller.find,
              child: const Text("Find"),
            ),
            const SizedBox(height: 32),
            Obx(() => controller.comments.isNotEmpty
                ? Column(
                    children: controller.comments
                        .map((e) => Text(e.comment))
                        .toList(),
                  )
                : const Text("empty")),
          ],
        ),
      ),
    );
  }
}
