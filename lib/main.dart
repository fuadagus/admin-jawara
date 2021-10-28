import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_jawara/pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
