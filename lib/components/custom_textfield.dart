import 'package:athkar/const.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.labeltext = "",
    required this.conpadver,
    required this.conpadhor,
    required this.maxlines,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
  });

  final String labeltext;
  final double conpadver;
  final double conpadhor;
  final int maxlines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value == "") {
            return 'من فضلك ادخل هذا الحقل';
          }
        },
        maxLines: maxlines,
        cursorColor: Color(0xff52ebd6),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
            contentPadding: EdgeInsets.symmetric(
                vertical: conpadver, horizontal: conpadhor),
            labelText: labeltext,
            labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: kPrimaryFont),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kPrimaryCOlor, width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black, width: 1.5))),
      ),
    );
  }
}
