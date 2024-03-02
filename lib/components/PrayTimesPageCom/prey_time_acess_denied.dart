import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/getpraytimeCubit/cubit/get_pray_time_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoLocationAcess extends StatelessWidget {
  const NoLocationAcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "تم رفض الوصول الي موقعك",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: kPrimaryFont),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "من فضلك يجب القبول علي الوصول لموقعك",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "1- افتح تطبيق Settings(الاعدادات) علي جهازك\n" +
                "2- انقر علي التبيقات(Apps)\n" +
                "3-انقر فوق التطبيق الذي تريد تغييره\n" +
                "4-انقر علي الاذونات(Permissions)\n" +
                "5-انقر علي الموقع(Location)\n" +
                "6-انقر علي السماح عند استخدام التطبيق(Allow only while using the app)\n" +
                "7-انقر علي اعادة المحاولة",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: kPrimaryFont),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryCOlor)),
              onPressed: () async {
                BlocProvider.of<GetPrayTimeCubit>(context)
                    .getpraytimes(DateTime.now());
              },
              child: Text(
                'اعادة المحاولة',
                style: TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
              ))
        ],
      ),
    );
  }
}
