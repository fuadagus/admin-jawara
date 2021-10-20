import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_jawara/pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin jawara',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      home: const MyHomePage(),
    );
  }
}
