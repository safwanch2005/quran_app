import 'package:flutter/material.dart';
import 'package:quran_app/screen/surah_list.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurahList(),
    );
  }
}
