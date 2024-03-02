import 'package:athkar/const.dart';
import 'package:athkar/services/getdata.dart';
import 'package:flutter/material.dart';

class AbbBarAzkar extends StatelessWidget {
  AbbBarAzkar({super.key, required this.text});
  final String date = GetDataServices().getHigriDate();
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          date,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
              fontFamily: kPrimaryFont),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.white, fontFamily: kPrimaryFont, fontSize: 22),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
