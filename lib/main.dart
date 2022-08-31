import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_app/home/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Ubuntu'
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
