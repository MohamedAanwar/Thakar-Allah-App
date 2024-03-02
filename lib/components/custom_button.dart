import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.onTap, required this.isloading});
  final String text;
  final void Function()? onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: kPrimaryCOlor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: isloading == true
                ? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4,
                  )
                : Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: kPrimaryFont),
                  )),
      ),
    );
  }
}
