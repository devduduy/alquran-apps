import 'package:alquran_apps/app/constant/color.dart';
import 'package:alquran_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Al-Quran Apps',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: controller.isDark.isTrue ? appOrange : appPurple),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Obx(() => Text(
                    'Sesibuk itukah kamu sampai belum membaca Alquran ?',
                    style: TextStyle(
                        fontSize: 18,
                        color: controller.isDark.isTrue ? appWhite : appPurple),
                    textAlign: TextAlign.center,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset('assets/lotties/animation-quran.json')),
            ElevatedButton(
              onPressed: () =>
                  Get.offAllNamed(Routes.HOME, arguments: controller.isDark),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Text(
                'GET STARTED',
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.all(5),
        child: Text(
          'Versi 1.0.0',
          style: TextStyle(fontSize: 11),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
          controller.isDark.toggle();
        },
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
