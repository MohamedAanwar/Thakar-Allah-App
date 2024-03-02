import 'package:athkar/components/bottomviewbutton.dart';
import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/main_app_cubit/azkar_app_body_cubit.dart';
import 'package:athkar/cubits/cubit/getpraytimeCubit/cubit/get_pray_time_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: kPrimaryCOlor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomViewButton(
                  image: 'assets/ornament.png',
                  text: "الاذكار",
                  onTap: () {
                    BlocProvider.of<AzkarAppBodyCubit>(context).getfirstpage();
                  },
                ),
                BottomViewButton(
                  image: 'assets/hand-gesture.png',
                  text: "الادعية",
                  onTap: () {
                    BlocProvider.of<AzkarAppBodyCubit>(context).getsecondpage();
                  },
                ),
                BottomViewButton(
                    image: 'assets/rosary.png',
                    text: "المسبحة",
                    onTap: () {
                      BlocProvider.of<AzkarAppBodyCubit>(context)
                          .getfourthpage();
                    }),
                BottomViewButton(
                  onTap: () {
                    BlocProvider.of<GetPrayTimeCubit>(context)
                        .getpraytimes(DateTime.now());
                    BlocProvider.of<AzkarAppBodyCubit>(context).getfifthpage();
                  },
                  image: 'assets/prayer-mat.png',
                  text: "م الصلاة",
                ),
                BottomViewButton(
                  image: 'assets/more.png',
                  text: "المزيد",
                  onTap: () {
                    BlocProvider.of<AzkarAppBodyCubit>(context).getlastpage();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
