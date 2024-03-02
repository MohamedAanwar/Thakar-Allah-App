import 'package:athkar/components/AzkarPageCom/appbar_azkar.dart';
import 'package:athkar/components/custom_item.dart';
import 'package:athkar/components/custom_tmplete.dart';
import 'package:athkar/models/azkaritemmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrayerBody extends StatelessWidget {
  const PrayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AzkarAndDoaaItemModel> azmodedl = [
      AzkarAndDoaaItemModel(
          image: "assets/quran2.png",
          text: "أدعية قرآنية",
          filename: 'ادعية قرآنية'),
      AzkarAndDoaaItemModel(
          image: "assets/muhammad.png",
          text: "أدعية الأنبياء",
          filename: 'ادعية نبوية'),
      AzkarAndDoaaItemModel(
          image: "assets/prayy.png",
          text: "أدعية المتوفى",
          filename: 'ادعية المتوفى'),
      AzkarAndDoaaItemModel(
          image: "assets/prayy.png",
          text: "أدعية المغفرة والتوبة",
          filename: 'ادعية المغفرة والتوبة'),
      AzkarAndDoaaItemModel(
          image: "assets/prayy.png",
          text: "أدعية ختم القران",
          filename: 'ادعية ختم القران'),
      AzkarAndDoaaItemModel(
          image: "assets/prayy.png",
          text: "أدعية ذهاب الهم",
          filename: 'ادعية ذهاب الهم'),
      AzkarAndDoaaItemModel(
          image: "assets/prayy.png",
          text: "أدعية طلب العلم",
          filename: 'ادعية طلب العلم'),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView(
        children: [
          AbbBarAzkar(text: 'بما تحب أن تدعو'),
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
                            builder: (context) => CustomTemplete(
                                  type: azmodedl[index].filename,
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

// class CustomWidgetPray extends StatelessWidget {
//   const CustomWidgetPray({super.key, required this.text, this.onTap});
//   final String text;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           height: 55,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Color(0xfff5f5f5),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   spreadRadius: 3,
//                   blurRadius: 7,
//                   offset: Offset(0, 3))
//             ],
//           ),
//           child: Center(
//             child: Text(
//               '$text',
//               style: TextStyle(
//                 fontFamily: kPrimaryFont,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
