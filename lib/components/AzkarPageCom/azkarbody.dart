import 'package:athkar/components/AzkarPageCom/appbar_azkar.dart';
import 'package:athkar/components/custom_item.dart';
import 'package:athkar/models/azkaritemmodel.dart';
import 'package:athkar/views/azkar_view.dart';
import 'package:flutter/material.dart';

class AzkarBody extends StatelessWidget {
  const AzkarBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<AzkarAndDoaaItemModel> azmodedl = [
      AzkarAndDoaaItemModel(
        image: "assets/morning.png",
        text: "أذكار الصباح",
        filename: 'adkar',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/moon.png",
        text: "أذكار المساء",
        filename: 'adkar',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/wudhu.png",
        text: "أذكار الوضوء",
        filename: 'adkar',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/mosque.png",
        text: "أذكار المسجد",
        filename: 'أذكار المسجد',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/sleep.png",
        text: "أذكار النوم",
        filename: 'adkar',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/salat.png",
        text: "أذكار الصلاة",
        filename: 'أذكار الصلاه',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/dinner.png",
        text: "أذكار الطعام",
        filename: 'أذكار الطعام',
      ),
      AzkarAndDoaaItemModel(
        image: "assets/dua.png",
        text: "أذكار بعد الصلاة",
        filename: 'أذكار بعد الصلاة',
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView(
        children: [
          AbbBarAzkar(text: "بما تحب أن تبدأ اذكارك"),
          Container(
            child: GridView.builder(
              itemCount: azmodedl.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return CustomItem(
                  image: azmodedl[index].image,
                  text: azmodedl[index].text,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AzkarView(
                                  azkarType: azmodedl[index].text,
                                  filename: azmodedl[index].filename,
                                )));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
