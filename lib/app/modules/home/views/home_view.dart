import 'package:alquran_apps/app/constant/color.dart';
import 'package:alquran_apps/app/data/models/juz.dart' as juz;
import 'package:alquran_apps/app/data/models/surah.dart';
import 'package:alquran_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    // controller.isDark = Get.arguments;
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    } else {
      controller.isDark.value = false;
    }

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      //   child: Container(
      //     padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(colors: [appPurpleLight1, appPurpleDark]),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Al-Quran Apps',
      //             style: TextStyle(
      //                 fontSize: 20.0,
      //                 fontWeight: FontWeight.w500,
      //                 color: Colors.white),
      //           ),
      //           IconButton(
      //             onPressed: () => Get.toNamed(Routes.SEARCH),
      //             icon: Icon(Icons.search),
      //             color: appWhite,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                  // color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  gradient:
                      LinearGradient(colors: [appPurpleLight1, appPurpleDark])),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Column(
                              children: [
                                Text(
                                  'Assalamualaikum',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: appWhite,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Yudha Permana,',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: controller.isDark.isTrue
                                          ? appOrange
                                          : appWhite),
                                ),
                              ],
                            )),
                        IconButton(
                          onPressed: () => Get.toNamed(Routes.SEARCH),
                          icon: Icon(Icons.search),
                          color: appWhite,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [appPurpleLight1, appOrange])),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.LAST_READ),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  bottom: 10,
                                  child: Opacity(
                                    opacity: 0.7,
                                    child: SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          'assets/images/read-quran.png',
                                          fit: BoxFit.contain,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.menu_book_rounded,
                                            color: appWhite,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Terakhir dibaca',
                                            style: TextStyle(
                                                color: appWhite,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Al-Fatihah',
                                        style: TextStyle(
                                            color: appWhite,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Juz 1 | Ayat 5',
                                        style: TextStyle(color: appWhite),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => TabBar(
                    indicatorColor:
                        controller.isDark.isTrue ? appOrange : appPurple,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    indicatorWeight: 3,
                    labelColor:
                        controller.isDark.isTrue ? appOrange : appPurple,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Surah',
                      ),
                      Tab(
                        text: 'Juz',
                      ),
                      Tab(
                        text: 'Bookmark',
                      ),
                    ])),
            Expanded(
              child: TabBarView(children: [
                FutureBuilder(
                  future: controller.getAllSurah(),
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
                        padding: EdgeInsets.only(top: 20),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Surah surah = snapshot.data![index];
                          return ListTile(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_SURAH,
                                  arguments: surah);
                            },
                            leading: Obx(() => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(controller
                                                  .isDark.isTrue
                                              ? 'assets/images/octagonal_for_dark.png'
                                              : 'assets/images/octagonal.png'))),
                                  child: Center(
                                      child: Text(
                                    '${surah.number}',
                                    style: TextStyle(
                                        color: controller.isDark.isTrue
                                            ? appWhite
                                            : appPurple),
                                  )),
                                )),
                            title: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  surah.name.transliteration.id,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: Obx(() => Text(
                                        ' (${surah.name.translation.id})',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                            color: controller.isDark.isTrue
                                                ? appOrange
                                                : appPurple),
                                      )),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Transform(
                                    transform: new Matrix4.identity()
                                      ..scale(0.7),
                                    child: Chip(
                                      avatar: Icon(
                                        Icons.menu_book_outlined,
                                        size: 16,
                                      ),
                                      label: Text(
                                        '${surah.numberOfVerses} Ayat | ${surah.revelation.id}',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              surah.name.short,
                              style: TextStyle(fontSize: 18),
                            ),
                            isThreeLine: true,
                          );
                        });
                  },
                ),
                FutureBuilder(
                  future: controller.getAllJuz(),
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
                      padding: EdgeInsets.only(top: 20),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        juz.Juz detailJuz = snapshot.data![index];

                        String surahStart =
                            detailJuz.juzStartInfo?.split(" - ").first ?? "";
                        String surahEnd =
                            detailJuz.juzEndInfo?.split(" - ").first ?? "";

                        List<Surah> allSurahInJuzTemp = [];
                        List<Surah> allSurahInJuz = [];

                        for (Surah item in controller.allSurah) {
                          allSurahInJuzTemp.add(item);

                          if (item.name.transliteration.id == surahEnd) {
                            break;
                          }
                        }

                        for (Surah item
                            in allSurahInJuzTemp.reversed.toList()) {
                          allSurahInJuz.add(item);

                          if (item.name.transliteration.id == surahStart) {
                            break;
                          }
                        }

                        return ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                              "juz": detailJuz,
                              "surah": allSurahInJuz.reversed.toList()
                            });
                          },
                          leading: Obx(() => Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(controller
                                                .isDark.isTrue
                                            ? 'assets/images/octagonal_for_dark.png'
                                            : 'assets/images/octagonal.png'))),
                                child: Center(
                                    child: Text(
                                  '${index + 1}',
                                )),
                              )),
                          title: Text(
                            'Juz ${index + 1}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Mulai dari ${detailJuz.juzStartInfo}",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              Text(
                                "Sampai ${detailJuz.juzEndInfo}",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        );
                      },
                    );
                  },
                ),
                Center(child: Text('Page Bookmark')),
              ]),
            )
          ],
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
