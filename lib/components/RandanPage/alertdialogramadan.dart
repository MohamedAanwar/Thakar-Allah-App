import 'package:athkar/components/RandanPage/custom_widget_ramda.dart';
import 'package:athkar/components/RandanPage/page_more_600.dart';
import 'package:athkar/components/custom_page_more_page.dart';
import 'package:athkar/components/custom_tmplete.dart';
import 'package:athkar/const.dart';
import 'package:athkar/models/general_model.dart';
import 'package:athkar/services/getdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class AlertDialogRamdan extends StatefulWidget {
  AlertDialogRamdan({super.key});

  @override
  State<AlertDialogRamdan> createState() => _AlertDialogRamdanState();
}

class _AlertDialogRamdanState extends State<AlertDialogRamdan> {
  Future<List> loaddata(String type) async {
    List<GeneralModel> ramdanitems =
        await GetDataServices().getgeneraltext_label_number(type);
    List items = [];
    for (var element in ramdanitems) {
      items.add(
        CustomComponetnt(
          number: ramdanitems.indexOf(element) + 1,
          text: "${element.number}",
          onTap: () {
            element.label!.length > 420
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageMore600(
                              textbody: element.label!,
                              textabbbar: element.number!,
                            )))
                : showDialog(
                    context: context,
                    builder: (context) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                  child: Text(
                                "${element.number}",
                                style: TextStyle(
                                    fontFamily: kPrimaryFont,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryCOlor),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: kPrimaryCOlor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "${element.label}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: kPrimaryFont,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: kPrimaryCOlor,
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Share.share("${element.label}\n" +
                                          "\n\n تطبيق ذكر الله " +
                                          "قم بتنزبله من خلال الرابط : https://shorturl.at/rtzAB \n");
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 3,
                                                blurRadius: 7,
                                                offset: Offset(1, 1))
                                          ],
                                          color: kPrimaryCOlor,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    List mainramdanlist = [
      CustomWidgetRamdan(
        text: "نصائح لشهر رمضان",
        onTap: () async {
          List items = await loaddata("نصائح لشهر رمضان المبارك");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/ramdan.png",
                        textname: "نصائح لشهر رمضان المبارك",
                        Listofitems: items,
                      )));
        },
      ),
      CustomWidgetRamdan(
        text: "صحتك في شهر رمضان",
        onTap: () async {
          List items = await loaddata("صحتك في شهر رمضان المبارك");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/ramdan.png",
                        textname: "صحتك في شهر رمضان",
                        Listofitems: items,
                      )));
        },
      ),
      CustomWidgetRamdan(
        text: "أحكام وفتاوي في شهر رمضان",
        onTap: () async {
          List items = await loaddata("أحكام وفتاوى رمضان المبارك");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/ramdan.png",
                        textname: "أحكام وفتاوي في شهر رمضان",
                        Listofitems: items,
                      )));
        },
      ),
      CustomWidgetRamdan(
        text: "طرق ختم القرأن في رمضان",
        onTap: () async {
          List items = await loaddata("طرق ختم القران الكريم في رمضان");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/ramdan.png",
                        textname: "طرق ختم القران في رمضان",
                        Listofitems: items,
                      )));
        },
      ),
      CustomWidgetRamdan(
        text: "أدعية لشهر رمضان",
        onTap: () async {
          List items = await loaddata("أدعية لشهر رمضان المبارك");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomPageMorePage(
                        image: "assets/ramdan.png",
                        textname: "أدعية لشهر رمضان",
                        Listofitems: items,
                      )));
        },
      ),
    ];
    return AlertDialog(
      actions: [
        CircleAvatar(
            backgroundColor: kPrimaryCOlor,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                )))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: kPrimaryCOlor.withOpacity(0.8),
              child: Image.asset(
                "assets/ramdan.png",
                color: Colors.white,
                width: 60,
                height: 60,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "شهر رمضان",
            style: TextStyle(
                fontFamily: kPrimaryFont,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: kPrimaryCOlor),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.maxFinite,
            height: 420,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return mainramdanlist[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
