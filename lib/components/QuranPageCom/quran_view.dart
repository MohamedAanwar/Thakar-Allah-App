import 'package:athkar/const.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key, required this.initpage});
  final int initpage;
  @override
  State<QuranView> createState() => _QuranBodyState();
}

class _QuranBodyState extends State<QuranView> {
  int currentPageIndex = 0;
  int cd = 900;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  Future<void> _saveCurrentPageIndex(int pageIndex) async {
    Box bookbox = await Hive.openBox('box');
    bookbox.put('current_page', pageIndex);
  }

  Future<void> get() async {
    Box bookbox = await Hive.openBox('box');
    int value = bookbox.get('current_page', defaultValue: 0);
    setState(() {
      cd = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.rightSlide,
                    title: 'تاكيد',
                    desc: 'هل تريد وضع علامة عند هذه الصفحة؟',
                    btnOkOnPress: () {
                      setState(() {
                        _saveCurrentPageIndex(currentPageIndex == 0
                            ? widget.initpage
                            : currentPageIndex);
                        setState(() {
                          cd = currentPageIndex == 0
                              ? widget.initpage
                              : currentPageIndex;
                        });
                      });
                    },
                    btnCancelOnPress: () {},
                    btnOkText: "نعم",
                    btnCancelText: "لا",
                  ).show();
                },
                icon: Icon(
                  Icons.bookmark_added,
                  color: kPrimaryCOlor,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kPrimaryCOlor,
                  size: 25,
                )),
          ],
        ),
        body: PageView.builder(
          itemCount: quranlist.length,
          onPageChanged: (value) {
            currentPageIndex = value;
          },
          controller: PageController(initialPage: widget.initpage),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(quranlist[index]))),
                      ),
                      if (index == cd)
                        Positioned(
                            child: Icon(
                          Icons.bookmark_outlined,
                          color: Colors.red.withOpacity(0.4),
                          size: 100,
                        ))
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
