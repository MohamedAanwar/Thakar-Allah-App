import 'package:athkar/const.dart';
import 'package:athkar/models/azkar_model.dart';
import 'package:athkar/services/getdata.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key, required this.azkarType, required this.filename});
  final String azkarType;
  final String filename;

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  List<AzkarModel>? list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.azkarType == 'الرقية الشرعية' ||
        widget.azkarType == 'أذكار الطعام' ||
        widget.azkarType == 'أذكار المسجد' ||
        widget.azkarType == 'أذكار بعد الصلاة' ||
        widget.azkarType == 'أذكار الصلاة') {
      loaddataRoqia();
    } else {
      loaddata();
    }
  }

  ScrollController listScrollController = ScrollController();
  Future<void> loaddata() async {
    var data = await GetDataServices()
        .getMorningAzkar(widget.azkarType, widget.filename);

    setState(() {
      list = data;
    });
  }

  Future<void> loaddataRoqia() async {
    var data = await GetDataServices().getRoqia(widget.filename);

    setState(() {
      list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kPrimaryCOlor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kPrimaryCOlor,
          actions: [
            IconButton(
                onPressed: () {
                  if (widget.azkarType == 'الرقية الشرعية' ||
                      widget.azkarType == 'أذكار الطعام' ||
                      widget.azkarType == 'أذكار المسجد' ||
                      widget.azkarType == 'أذكار بعد الصلاة' ||
                      widget.azkarType == 'أذكار الصلاة') {
                    loaddataRoqia();
                  } else {
                    loaddata();
                  }
                  listScrollController.animateTo(
                    0,
                    duration: Duration(seconds: 2),
                    curve: Curves.easeOut,
                  );
                },
                icon: Icon(
                  Icons.replay_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ))
          ],
          centerTitle: true,
          title: Text(
            '${widget.azkarType}',
            style: TextStyle(fontFamily: kPrimaryFont, color: Colors.white),
          ),
        ),
        body: list == null
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : ListView.builder(
                controller: listScrollController,
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  int numbercount = list![index].count;
                  int counter = list![index].counter;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          list![index].dec();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                      child: Text(
                                    ((list!.indexOf(list![index])) + 1)
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: kPrimaryFont,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ((list![index].catname)),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: kPrimaryFont,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              list![index].content,
                              style: TextStyle(
                                  fontSize: 24, color: Colors.grey[200]),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${gettextnumberfromnum(numbercount)}',
                                  style: TextStyle(
                                      fontFamily: kPrimaryFont,
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                                Center(
                                  child: CircleAvatar(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          strokeAlign: 3,
                                          value: counter.toDouble() /
                                              numbercount.toDouble(),
                                          color: kPrimaryCOlor,
                                        ),
                                        Text(
                                          '${list![index].counter}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.7),
                                    radius: 30,
                                  ),
                                ),
                                Text(
                                  "${(list!.indexOf(list![index])) + 1} من ${list!.length}",
                                  style: TextStyle(
                                      fontFamily: kPrimaryFont,
                                      fontSize: 17,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  gettextnumberfromnum(num number) {
    if (number == 1) {
      return 'مرة واحدة';
    } else if (number == 3) {
      return 'ثلاث مرات';
    } else if (number == 4) {
      return 'اربع مرات';
    } else if (number == 7) {
      return 'سبع مرات';
    } else if (number == 10) {
      return 'عشر مرات';
    } else if (number == 100) {
      return 'مئة مرة';
    } else if (number == 33) {
      return 'ثلاثة وثلاثون مرة';
    } else if (number == 34) {
      return 'أربعة وثلاثون مرة';
    }
  }
}
