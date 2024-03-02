import 'package:athkar/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class PageMore600 extends StatelessWidget {
  const PageMore600(
      {super.key, required this.textabbbar, required this.textbody});
  final String textabbbar, textbody;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomSheet: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Share.share("${textbody}\n" +
                      "\n\n تطبيق ذكر الله " +
                      "قم بتنزبله من خلال الرابط : https://shorturl.at/rtzAB \n");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kPrimaryCOlor),
                  child: Center(
                    child: Text(
                      'مشاركة',
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: kPrimaryCOlor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ))
          ],
          title: Text(
            "$textabbbar",
            style: TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                "$textbody",
                style: TextStyle(fontFamily: kPrimaryFont, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
