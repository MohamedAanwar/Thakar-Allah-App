import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class AbbBarMorePage extends StatelessWidget {
  const AbbBarMorePage({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, right: 20),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: kPrimaryFont,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryCOlor),
            ),
            text == 'المزيد'
                ? Text("")
                : IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kPrimaryCOlor,
                    ),
                    onPressed: onPressed,
                  ),
            if (text == 'المزيد')
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'assets/logo.png',
                  width: 40,
                  height: 40,
                ),
              )
          ],
        ),
      ),
    );
  }
}
