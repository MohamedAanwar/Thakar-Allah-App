import 'package:athkar/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
            color: kPrimaryCOlor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 85,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/me.jpg"),
                ),
              ),
              Text(
                "Mohamed Anwar",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            String url = "https://wa.me/+201100106132";
            try {
              await launchUrlString(url);
            } catch (e) {
              throw Exception(e.toString());
            }
          },
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                size: 28,
                color: kPrimaryCOlor,
              ),
              title: Text(
                "(+20) 1100106132",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            String url = "mailto:moahamedanwar082@gmail.com";
            try {
              await launchUrlString(url);
            } catch (e) {
              throw Exception(e.toString());
            }
          },
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.email,
                size: 28,
                color: kPrimaryCOlor,
              ),
              title: Text(
                "moahamedanwar082@gmail.com",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            String url = "https://www.facebook.com/coyo.mohamed";
            try {
              await launchUrlString(url);
            } catch (e) {
              throw Exception(e.toString());
            }
          },
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.facebook,
                size: 28,
                color: kPrimaryCOlor,
              ),
              title: Text(
                "https://www.facebook.com/coyo.mohamed",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        Spacer(
          flex: 2,
        )
      ]),
    );
  }
}
