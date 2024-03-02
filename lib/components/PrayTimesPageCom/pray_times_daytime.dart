import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class DayNoAndText extends StatelessWidget {
  const DayNoAndText({
    super.key,
    this.onTap,
    required this.textup,
    required this.textdown,
    required this.isActive,
  });
  final void Function()? onTap;
  final String textup, textdown;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(textup,
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  Text(textdown,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textup,
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                Text(textdown,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          );
  }
}
