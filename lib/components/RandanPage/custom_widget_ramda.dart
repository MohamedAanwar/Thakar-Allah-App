import 'package:athkar/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomWidgetRamdan extends StatelessWidget {
  const CustomWidgetRamdan({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryCOlor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 50,
          height: 75,
          child: Center(
            child: Text(
              "$text",
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
