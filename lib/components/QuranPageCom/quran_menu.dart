import 'package:athkar/components/MorePageCom/abb_bar_more_page.dart';
import 'package:athkar/components/QuranPageCom/quran_item.dart';
import 'package:athkar/components/QuranPageCom/quran_view.dart';
import 'package:athkar/const.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class QuranMenu extends StatefulWidget {
  const QuranMenu({super.key});

  @override
  State<QuranMenu> createState() => _QuranMenuState();
}

class _QuranMenuState extends State<QuranMenu> {
  List<dynamic> filtereddata = [];
  String query = "";
  List<QuranItem> quranitemslist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 114; i++) {
      quranitemslist.add(QuranItem(
        number: i + 1,
        text: surahs[i],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuranView(initpage: (numberpagesurah[i]) - 1)));
        },
      ));
    }
    filtereddata.addAll(quranitemslist);
  }

  void filterSearchdata(String query) {
    List<QuranItem> searchlist = [];
    searchlist.addAll(quranitemslist);
    if (query.isNotEmpty) {
      List<QuranItem> dummylistdata = [];
      searchlist.forEach((element) {
        if (element.text.toLowerCase().contains(query.toLowerCase())) {
          dummylistdata.add(element);
        }
      });
      setState(() {
        filtereddata.clear();
        filtereddata.addAll(dummylistdata);
      });
    } else {
      setState(() {
        filtereddata.clear();
        filtereddata.addAll(quranitemslist);
      });
    }
  }

  void filterSearchdataNumbers(int query) {
    List<QuranItem> searchlist = [];
    searchlist.addAll(quranitemslist);
    if (!query.isNaN) {
      List<QuranItem> dummylistdata = [];
      searchlist.forEach((element) {
        if (element.number == query) {
          dummylistdata.add(element);
        }
      });
      setState(() {
        filtereddata.clear();
        filtereddata.addAll(dummylistdata);
      });
    } else {
      setState(() {
        filtereddata.clear();
        filtereddata.addAll(quranitemslist);
      });
    }
  }

  bool isnumber(String str) {
    if (str.isEmpty) {
      return false;
    }
    return int.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Box bookbox = await Hive.openBox('box');
              int init = bookbox.get("current_page", defaultValue: 0);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuranView(initpage: init),
                ),
              );
            },
            child: Icon(
              Icons.bookmark,
              color: kPrimaryCOlor,
            )),
        backgroundColor: kPrimaryCOlor,
        body: Column(
          children: [
            AbbBarMorePage(
              text: "القرأن الكريم",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xfff5f5f5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                    if (value.isNotEmpty && isnumber(value)) {
                      filterSearchdataNumbers(int.parse(value));
                    } else {
                      filterSearchdata(value);
                    }
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      suffixIcon: Icon(Icons.search),
                      hintText: "بحث باسم او رقم السورة",
                      hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: kPrimaryFont,
                          fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: filtereddata.length,
              itemBuilder: (context, index) {
                return filtereddata[index];
              },
            ))
          ],
        ),
      ),
    );
  }
}
// return quranitemslist[index];
