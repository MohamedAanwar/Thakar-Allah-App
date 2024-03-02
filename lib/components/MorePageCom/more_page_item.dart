import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class MoreItemCom extends StatelessWidget {
  const MoreItemCom(
      {super.key,
      required this.image,
      required this.textup,
      required this.textdown,
      this.onTap});
  final String image;
  final String textup;
  final String textdown;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              child: Image.asset(
                image,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textup,
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  textdown,
                  style:
                      TextStyle(fontFamily: kPrimaryFont, color: Colors.grey),
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
