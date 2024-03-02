import 'package:athkar/const.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setrait();
  }

  void setrait() async {
    Box raitbox = await Hive.openBox('rait');
    setState(() {
      _rating = raitbox.get('raiting', defaultValue: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryCOlor,
          title: Text(
            'قيم التطبيق',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: kPrimaryFont),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'هل اعجبك التطبيق ؟ ',
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: kPrimaryFont,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.star,
                        color: _rating >= 1 ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(() {
                        _rating = 1;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.star,
                        color: _rating >= 2 ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(() {
                        _rating = 2;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.star,
                        color: _rating >= 3 ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(() {
                        _rating = 3;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.star,
                        color: _rating >= 4 ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(() {
                        _rating = 4;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(Icons.star,
                        color: _rating >= 5 ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(() {
                        _rating = 5;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'لقد قيمتنا: $_rating',
                style: TextStyle(fontSize: 18.0, fontFamily: kPrimaryFont),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  Box raitbox = await Hive.openBox('rait');
                  raitbox.put("raiting", _rating);
                  if (_rating <= 3) {
                    setState(() {
                      title = "برجاء التواصل مع المطور واخباره المشكلة";
                    });
                  } else {
                    setState(() {
                      title = "تم ارسال تقيمك بنجاح شكرا لك";
                    });
                  }
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    title: 'تقيم التطبيق',
                    desc: title,
                    btnOkOnPress: () {
                      Navigator.pop(context);
                    },
                    btnOkText: "العودة للتطبيق",
                  ).show();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: kPrimaryCOlor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'حفظ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: kPrimaryFont,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
