import 'package:athkar/components/AzkarPageCom/azkarbody.dart';
import 'package:athkar/components/bottom_nav_bar.dart';
import 'package:athkar/components/TsbihPageCom/masbha_body.dart';
import 'package:athkar/components/MorePageCom/more_body.dart';
import 'package:athkar/components/PrayTimesPageCom/pray_time_body.dart';
import 'package:athkar/components/PrayerPageCom/prayer_body.dart';

import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/main_app_cubit/azkar_app_body_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryCOlor,
      bottomNavigationBar: const BottomNavBar(),
      body: Builder(),
    );
  }
}

class Builder extends StatelessWidget {
  const Builder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarAppBodyCubit, AzkarAppBodyState>(
      builder: (context, state) {
        if (state is AzkarAppBodyInitial) {
          return AzkarBody();
        } else if (state is AzkarAppBodyPrayer) {
          return PrayerBody();
        } else if (state is AzkarAppBodyRosary) {
          return MasbahaBody();
        } else if (state is AzkarAppBodyPrayTimes) {
          return PrayTimeBody();
        } else if (state is AzkarAppBodyMore) {
          return MoreBody();
        } else {
          throw Exception();
        }
      },
    );
  }
}
