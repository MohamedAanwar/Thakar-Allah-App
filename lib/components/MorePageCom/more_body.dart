import 'package:athkar/components/MorePageCom/abb_bar_more_page.dart';
import 'package:athkar/components/MorePageCom/more_page_item.dart';
import 'package:athkar/components/QuranPageCom/quran_menu.dart';
import 'package:athkar/components/RandanPage/alertdialogramadan.dart';
import 'package:athkar/components/RoqiaPage/alert_roqia.dart';
import 'package:athkar/components/custom_page_more_page.dart';
import 'package:athkar/components/custom_tmplete.dart';
import 'package:athkar/views/developer_view.dart';
import 'package:athkar/views/god_names.dart';
import 'package:athkar/views/raiting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    List list = [
      MoreItemCom(
        textup: "القرأن الكريم",
        textdown: "القرأن الكريم مكتوب كامل",
        image: "assets/quran.png",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuranMenu()));
        },
      ),
      MoreItemCom(
        textup: "احاديث نبوية",
        textdown: "احاديث نبوية صحيحة مكتوبة",
        image: "assets/muhammad.png",
        onTap: () {
          List items = [
            CustomComponetnt(
              number: 1,
              text: "أحاديث عامة",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عامة',
                            )));
              },
            ),
            CustomComponetnt(
              number: 2,
              text: "أحاديث عن الصداقة",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عن الصداقة',
                            )));
              },
            ),
            CustomComponetnt(
              number: 3,
              text: "أحاديث عن الصدق",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عن الصدق',
                            )));
              },
            ),
            CustomComponetnt(
              number: 4,
              text: "أحاديث عن العلم",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عن العلم',
                            )));
              },
            ),
            CustomComponetnt(
              number: 5,
              text: "أحاديث عن الماء",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عن الماء',
                            )));
              },
            ),
            CustomComponetnt(
              number: 6,
              text: "أحاديث عن النظافة",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: 'أحاديث عن النظافة',
                            )));
              },
            ),
            CustomComponetnt(
              number: 7,
              text: "أحاديث مبوبة",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: "أحاديث مبوبة",
                            )));
              },
            ),
            CustomComponetnt(
              number: 8,
              text: "العشرة المبشرين بالجنة",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomTemplete(
                              type: "العشرة المبشرين بالجنة",
                            )));
              },
            ),
          ];
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/muhammad.png",
                        textname: "أحاديث نبوية",
                        Listofitems: items,
                      )));
        },
      ),
      MoreItemCom(
        textup: "شهر رمضان",
        textdown: "كل ما يخص شهر رمضان الكريم",
        image: "assets/ramdan.png",
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogRamdan();
            },
          );
        },
      ),
      MoreItemCom(
        textup: "سنن مؤكدة",
        textdown: "سنن مؤكدة عن النبي",
        image: "assets/ornament.png",
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomTemplete(
                        type: "سنن مؤكدة",
                      )));
        },
      ),
      MoreItemCom(
        textup: "الرقية الشرعية",
        textdown: "الرقية الشرعية كاملة مكتوبة",
        image: "assets/sick.png",
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Directionality(
                    textDirection: TextDirection.rtl, child: AlertRoqia());
              });
        },
      ),
      MoreItemCom(
        textup: "فرص ذهبية",
        textdown: "اعمال يسيرة أجورها كبيرة",
        image: "assets/starhand.png",
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomTemplete(
                        type: "فرص ذهبية",
                      )));
        },
      ),
      MoreItemCom(
        textup: "علمني شئ في الاسلام",
        textdown: "تعليم بعض الاشيئاء في الاسلام",
        image: "assets/book.png",
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomTemplete(
                        type: "علمنى شيء فى الإسلام",
                      )));
        },
      ),
      MoreItemCom(
        textup: "أسماء الله الحسني",
        textdown: "أسماء الله الحسني كاملة",
        image: "assets/allah-word.png",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GodNamesView()));
        },
      ),
      MoreItemCom(
        textup: "تقيم التطبيق",
        textdown: "من فضلك شارك معنا تقيمك",
        image: "assets/star.png",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RatingPage()));
        },
      ),
      MoreItemCom(
        textup: "المطور",
        textdown: "التواصل مع مطور التطبيق",
        image: "assets/programmer.png",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Info()));
        },
      ),
      MoreItemCom(
        textup: "مشاركة التطبيق",
        textdown: "من فضلك ساعدنا علي نشر التطبيق",
        image: "assets/logo.png",
        onTap: () {
          Share.share("أَلا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ\n" +
              "تطبيق ذكر الله: أذكار, أدعية, قرأن, احاديث, م الصلاة و فوائد اخري\n" +
              "https://shorturl.at/rtzAB");
        },
      ),
    ];
    return Column(
      children: [
        AbbBarMorePage(text: 'المزيد'),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
        )
      ],
    );
  }
}
