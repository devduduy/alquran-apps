import 'package:alquran_apps/app/constant/color.dart';
import 'package:alquran_apps/app/data/models/detail_surah.dart' as detail;
import 'package:alquran_apps/app/data/models/surah.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;
  var themeData = ThemeData(
    useMaterial3: true,
  );

  DetailSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Surah ${surah.name.transliteration.id}',
            // style: TextStyle(color: appPurpleDark),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            //Header Detail Surah
            GestureDetector(
              onTap: () => Get.defaultDialog(
                  title: 'Tafsir',
                  titleStyle: TextStyle(fontWeight: FontWeight.bold),
                  content: Flexible(
                    child: Text(
                      surah.tafsir.id,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(colors: [appPurpleLight1, appOrange])),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        surah.name.short,
                        style: TextStyle(
                            fontSize: 25,
                            color: appWhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            surah.name.transliteration.id,
                            style: TextStyle(
                                fontSize: 16,
                                color: appWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ( ${surah.name.translation.id} )',
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: appPurpleDark),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(
                            avatar: Icon(
                              Icons.menu_book_outlined,
                              color: themeData.primaryColor,
                            ),
                            label: Text(
                              '${surah.numberOfVerses} Ayat',
                              style: TextStyle(color: appPurple),
                            ),
                            backgroundColor: appWhite,
                          ),
                          Text(
                            ' - ',
                            style: TextStyle(color: appWhite),
                          ),
                          Chip(
                            avatar: Icon(
                              Icons.mosque_outlined,
                              color: themeData.primaryColor,
                            ),
                            label: Text(surah.revelation.id,
                                style: TextStyle(color: appPurple)),
                            backgroundColor: appWhite,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //List Ayat Detail Surah
            FutureBuilder(
                future: controller.getDetailSurah(surah.number),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text('Data tidak ditemukan.'));
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: surah.numberOfVerses,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.verses.isEmpty) {
                          return SizedBox();
                        }

                        detail.Verse ayat = snapshot.data!.verses[index];
                        ArabicNumbers arabicNumber = ArabicNumbers();

                        return Column(
                          children: [
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
                                      arabicNumber.convert(index + 1),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Get.isDarkMode
                                              ? appWhite
                                              : appPurple),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ayat.text.arab,
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
                                ayat.text.transliteration.en,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                    color:
                                        Get.isDarkMode ? appOrange : appPurple),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ayat.translation.id,
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // CircleAvatar(
                                    //   child: Text(' ${index + 1}'),
                                    // ),
                                    SizedBox(),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.bookmark_add_outlined,
                                                color: Get.isDarkMode
                                                    ? appWhite
                                                    : appPurple)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.play_arrow,
                                                color: Get.isDarkMode
                                                    ? appWhite
                                                    : appPurple))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        );
                      });
                })
          ],
        ));
  }
}
