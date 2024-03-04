import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/data/quran_api_provider.dart';
import 'package:quran_app/screen/ayah_list.dart';

class SurahItem extends StatefulWidget {
  const SurahItem({super.key});

  @override
  State<SurahItem> createState() => _SurahItemState();
}

class _SurahItemState extends State<SurahItem> {
  dynamic dataArabic;
  dynamic dataEnglish;

  @override
  void initState() {
    getSurahArabic();
    getSurahEnglish();
    super.initState();
  }

  getSurahArabic() async {
    dataArabic = await ApiProvider().getDataArabic();
    setState(() {});
    print("got arabic");
  }

  getSurahEnglish() async {
    dataEnglish = await ApiProvider().getDataEnglish();
    setState(() {});
    print("got english");
  }

  @override
  Widget build(BuildContext context) {
    return dataArabic == null
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.white60,
          ))
        : Column(
            children: [
              // Text(value.toString()),
              Expanded(
                child: ListView.separated(
                  itemCount: dataArabic.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ayahs(
                                      dataArabic: dataArabic[index],
                                      dataEnglish: dataEnglish[index],
                                    )));
                      },
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        "${(index + 1).toString()}"
                                "-"
                                " ${dataArabic[index]["englishName"]} - " +
                            dataArabic[index]["name"],
                        style: GoogleFonts.lateef(
                            fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.white38,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
