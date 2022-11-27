import 'package:app_keuwangan/models/add_date.dart';
import 'package:app_keuwangan/ui/pages/home_screen.dart';
import 'package:app_keuwangan/ui/pages/stastict.dart';
import 'package:app_keuwangan/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Bottom(),
    );
  }
}
