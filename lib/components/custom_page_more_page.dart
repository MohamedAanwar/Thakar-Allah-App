import 'package:athkar/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPageMorePage extends StatelessWidget {
  CustomPageMorePage(
      {super.key,
      required this.Listofitems,
      required this.textname,
      required this.image});
  final List Listofitems;
  final String textname, image;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kPrimaryCOlor,
        appBar: AppBar(
          backgroundColor: kPrimaryCOlor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "$textname",
                style: TextStyle(
                    color: Color(0xfff5f5f5),
                    fontSize: 20,
                    fontFamily: kPrimaryFont,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xfff5f5f5),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView.builder(
            itemCount: Listofitems.length,
            itemBuilder: (context, index) {
              return Listofitems[index];
            },
          ),
        ),
      ),
    );
  }
}

class CustomComponetnt extends StatelessWidget {
  const CustomComponetnt(
      {super.key, required this.number, required this.text, this.onTap});
  final int number;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 75,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3))
          ], color: Color(0xfff5f5f5), borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.amber[500],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "$number",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                width: 8,
              ),
              VerticalDivider(
                color: Colors.amber[500],
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  "$text",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
