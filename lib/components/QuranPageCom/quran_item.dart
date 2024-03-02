import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  const QuranItem(
      {super.key, this.onTap, required this.number, required this.text});
  final void Function()? onTap;
  final int number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: kPrimaryCOlor.withOpacity(0.8),
                radius: 28,
                child: Text(
                  "${number}",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: kPrimaryCOlor,
            )
          ],
        ),
      ),
    );
  }
}
