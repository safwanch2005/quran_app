import 'package:flutter/material.dart';
import 'package:quran_app/screen/setting.dart';
import 'package:quran_app/widget/surah_item.dart';

class SurahList extends StatefulWidget {
  const SurahList({super.key});

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: const SurahItem(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black12,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          child: const Icon(
            Icons.settings,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
