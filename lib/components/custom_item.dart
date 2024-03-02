import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: Colors.white,
              width: 85,
              height: 85,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
