import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/TsbihFitchData/cubit/tsbih_fitch_data_cubit.dart';
import 'package:athkar/models/tsbih_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TsbihItem extends StatelessWidget {
  const TsbihItem({super.key, required this.ts});
  final TsbihModel ts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ts.content,
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: kPrimaryFont),
            ),
            IconButton(
                onPressed: () {
                  ts.delete();
                  BlocProvider.of<TsbihFitchDataCubit>(context).fetchalltsbih();
                },
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "عدد التسبيحات: ${ts.count} مرة",
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 17),
        ),
      ]),
    );
  }
}
