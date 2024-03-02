import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class CustomComPrayTime extends StatelessWidget {
  const CustomComPrayTime(
      {super.key,
      required this.prayname,
      required this.praytime,
      required this.image});
  final String prayname, praytime;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 75,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kPrimaryCOlor.withOpacity(0.2),
            child: Image.asset(
              image,
              height: 25,
              width: 25,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            prayname,
            style: TextStyle(
                fontFamily: kPrimaryFont,
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Text(praytime,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
