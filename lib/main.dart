import 'package:exam_app/pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'color.dart';



void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: greenSwatch,
        scaffoldBackgroundColor: greenSwatch[500],
      ),
      home: HomePage(),
    );
  }
}