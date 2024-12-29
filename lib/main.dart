import 'package:alquran_apps/app/constant/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
      theme: themeLight,
      darkTheme: themeDark,
    ),
  );
}

//for run android
//because in real device the theme color is not working
//just uncomment this

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           backgroundColor: Colors.green, // Change background color
//           foregroundColor: Colors.white, // Change icon color
//           elevation: 4, // Change elevation
//           shape: RoundedRectangleBorder( // Change button shape
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Demo'),
//       ),
//       body: Center(
//         child: Text(
//           'Press the floating action button!',
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
