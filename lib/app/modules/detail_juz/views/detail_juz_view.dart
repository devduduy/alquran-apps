import 'package:alquran_apps/app/constant/color.dart';
import 'package:alquran_apps/app/data/models/juz.dart' as juz;
import 'package:alquran_apps/app/data/models/surah.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments['juz'];
  final List<Surah> allSurahInJuz = Get.arguments['surah'];

  DetailJuzView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JUZ ${detailJuz.juz}'),
          centerTitle: true,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          itemCount: detailJuz.verses?.length,
          itemBuilder: (context, index) {
            if (detailJuz.verses!.isEmpty) {
              return SizedBox();
            }

            juz.Verses ayat = detailJuz.verses![index];
            ArabicNumbers arabicNumber = ArabicNumbers();

            if (index != 0) {
              if (ayat.number?.inSurah == 1) {
                controller.index++;
              }
            }

            return Column(
              children: [
                if (ayat.number?.inSurah == 1)
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [appPurpleLight1, appOrange])),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            allSurahInJuz[controller.index]
                                .name
                                .transliteration
                                .id,
                            style: TextStyle(
                                fontSize: 25,
                                color: appWhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Get.isDarkMode
                                  ? 'assets/images/octagonal_for_dark.png'
                                  : 'assets/images/octagonal.png'))),
                      child: Center(
                        child: Text(
                          arabicNumber.convert(ayat.number?.inSurah),
                          style: TextStyle(
                              fontSize: 17,
                              color: Get.isDarkMode ? appWhite : appPurple),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "${ayat.text?.arab}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${ayat.text?.transliteration?.en}",
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Get.isDarkMode ? appOrange : appPurple),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${ayat.translation?.id}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: appPurpleLight2.withOpacity(0.3)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(allSurahInJuz[controller.index]
                            .name
                            .transliteration
                            .id),
                        SizedBox(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_add_outlined,
                                    color:
                                        Get.isDarkMode ? appWhite : appPurple)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.play_arrow,
                                    color:
                                        Get.isDarkMode ? appWhite : appPurple))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            );
          },
        ));
  }
}
