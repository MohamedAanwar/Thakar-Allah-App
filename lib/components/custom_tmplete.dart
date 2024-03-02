import 'package:athkar/const.dart';
import 'package:athkar/models/general_model.dart';

import 'package:athkar/services/getdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class CustomTemplete extends StatefulWidget {
  const CustomTemplete({super.key, this.type});
  final type;

  @override
  State<CustomTemplete> createState() => _CustomTempleteState();
}

class _CustomTempleteState extends State<CustomTemplete> {
  List<GeneralModel> data = [];
  List<GeneralModel> data2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.type == 'أحاديث مبوبة' ||
        widget.type == 'العشرة المبشرين بالجنة' ||
        widget.type == "علمنى شيء فى الإسلام") {
      getdatatwo();
    } else {
      getdataone();
    }
  }

  void getdataone() async {
    List<GeneralModel> getdatalist =
        await GetDataServices().getgeneraltext(widget.type);
    setState(() {
      data = getdatalist;
    });
  }

  void getdatatwo() async {
    List<GeneralModel> getdatalist =
        await GetDataServices().getgeneraltext_label_number(widget.type);
    setState(() {
      data2 = getdatalist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kPrimaryCOlor,
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
            "${widget.type}",
            style: TextStyle(
                color: Colors.white, fontFamily: kPrimaryFont, fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data.isEmpty ? data2.length : data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 18),
                        child: Text(
                          "${data.isEmpty ? data2[index].label : data[index].text}",
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontSize: 18,
                              height: 1.7),
                        ),
                      ),
                      Divider(
                        indent: 25,
                        endIndent: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 3,
                              height: 30,
                              color: kPrimaryCOlor,
                              child: Text(""),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${data.isEmpty ? data2[index].number : widget.type}",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Share.share(
                                    "${data.isEmpty ? data2[index].label : data[index].text}\n" +
                                        "\n\n تطبيق ذكر الله " +
                                        "قم بتنزبله من خلال الرابط : https://shorturl.at/rtzAB \n");
                              },
                              child: CircleAvatar(
                                backgroundColor: kPrimaryCOlor.withOpacity(0.8),
                                radius: 20,
                                child: Icon(
                                  Icons.share_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
