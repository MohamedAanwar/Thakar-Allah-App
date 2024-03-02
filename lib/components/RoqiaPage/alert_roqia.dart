import 'package:athkar/const.dart';
import 'package:athkar/views/azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertRoqia extends StatelessWidget {
  const AlertRoqia({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AzkarView(
                        azkarType: "الرقية الشرعية", filename: "Roqia")));
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: kPrimaryCOlor, borderRadius: BorderRadius.circular(8)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'فهمت ذلك',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: kPrimaryFont,
                    fontSize: 18),
              ),
            ),
          ),
        )
      ],
      title: Text(
        'ارشادات عامة يجب أن تُراعي عند الرقية الشرعية',
        style: TextStyle(fontWeight: FontWeight.w600, fontFamily: kPrimaryFont),
      ),
      content: buildview(context),
    );
  }
}

Widget buildview(BuildContext context) {
  return Container(
    width: double.maxFinite,
    child: ListView.builder(
        itemCount: arshdad.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "* ${arshdad[index]}.",
              style: TextStyle(
                fontFamily: kPrimaryFont,
                fontSize: 19,
              ),
            ),
          );
        }),
  );
}
