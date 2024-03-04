import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AyahItems extends StatelessWidget {
  AyahItems({super.key, this.dataArabic, this.dataEnglish});
  dynamic dataArabic;
  dynamic dataEnglish;
  @override
  Widget build(BuildContext context) {
    //print(dataArabic["ayahs"][0]["numberInSurah"]);
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: dataArabic["ayahs"].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    index == 0
                        ? Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: SelectableText(
                                  "${dataArabic["englishName"]} - ${dataArabic["name"]}\n${dataArabic["englishNameTranslation"]}",
                                  style: GoogleFonts.lateef(
                                      color: Colors.white70, fontSize: 50),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SelectableText(
                                'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                                style: GoogleFonts.lateef(
                                    color: Colors.white, fontSize: 40),
                                textAlign: TextAlign.center,
                              ),
                              SelectableText(
                                "In the name of God, Most Gracious, Most Merciful .",
                                style: GoogleFonts.lateef(
                                    color: Colors.white70, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: dataArabic["number"] == 1 ? 0 : 25,
                              )
                            ],
                          )
                        : const SizedBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerRight,
                      child: index == 0
                          ? SelectableText(
                              "${dataArabic["ayahs"][index]["text"].toString().replaceAll('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ', '')}"
                              "${dataArabic["number"] != 1 ? ' (${index + 1})' : ''}",
                              style: GoogleFonts.lateef(
                                  color: Colors.white, fontSize: 40),
                              textAlign: TextAlign.end,
                            )
                          : SelectableText(
                              "${dataArabic["ayahs"][index]["text"]}"
                              "${dataArabic["number"] != 1 ? ' (${index + 1})' : ''}",
                              style: GoogleFonts.lateef(
                                  color: Colors.white, fontSize: 40),
                              textAlign: TextAlign.end,
                            ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerLeft,
                      child: index == 0 && dataArabic["number"] == 1
                          ? Container()
                          : dataArabic["number"] == 1
                              ? SelectableText(
                                  "${(index).toString()}. ${dataEnglish["ayahs"][index]["text"].toString()}",
                                  style: GoogleFonts.lateef(
                                      color: Colors.white70, fontSize: 28),
                                  //textAlign: TextAlign.start,
                                )
                              : SelectableText(
                                  "${(index + 1).toString()}. ${dataEnglish["ayahs"][index]["text"].toString()}",
                                  style: GoogleFonts.lateef(
                                      color: Colors.white70, fontSize: 28),
                                  //textAlign: TextAlign.start,
                                ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.grey,
                thickness: 0.4,
              );
            },
          ),
        ),
      ],
    );
  }
}
