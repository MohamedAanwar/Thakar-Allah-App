import 'package:athkar/const.dart';

import 'package:flutter/material.dart';

class BottomViewButton extends StatelessWidget {
  const BottomViewButton({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });
  final String image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 35,
            height: 35,
            color: Colors.white,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: kPrimaryFont, color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
