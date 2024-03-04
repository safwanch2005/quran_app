import 'package:flutter/material.dart';
import 'package:quran_app/widget/ayah_items.dart';

// ignore: must_be_immutable
class Ayahs extends StatelessWidget {
  Ayahs({super.key, this.dataArabic, this.dataEnglish});
  dynamic dataArabic;
  dynamic dataEnglish;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: AyahItems(
          dataArabic: dataArabic,
          dataEnglish: dataEnglish,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black12,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
