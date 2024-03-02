import 'package:athkar/components/PrayTimesPageCom/custom_com_praytime.dart';
import 'package:athkar/components/PrayTimesPageCom/pray_times_daytime.dart';

import 'package:athkar/components/PrayTimesPageCom/prey_time_acess_denied.dart';
import 'package:athkar/const.dart';

import 'package:athkar/cubits/cubit/getpraytimeCubit/cubit/get_pray_time_cubit.dart';
import 'package:athkar/services/getdata.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrayTimeBody extends StatefulWidget {
  const PrayTimeBody({super.key});

  @override
  State<PrayTimeBody> createState() => _PrayTimeBodyState();
}

class _PrayTimeBodyState extends State<PrayTimeBody> {
  DateTime day = DateTime.now();
  bool isactive = true;
  int currentindex = 0;
  bool isloadig = false;
  DateTime indexday = DateTime.now();
  List<DateTime> days = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 3)),
    DateTime.now().add(Duration(days: 4)),
    DateTime.now().add(Duration(days: 5)),
  ];
  List<String> images = [
    'assets/sunrise.png',
    'assets/sunrise.png',
    'assets/sun.png',
    'assets/halfsun.png',
    'assets/sunset.png',
    'assets/isha.png'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(color: kPrimaryCOlor),
      inAsyncCall: isloadig,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  "مواقيت الصلاة",
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () async {
                    setState(() {
                      isloadig = true;
                    });
                    Position currentPosition =
                        await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);
                    String url =
                        "https://www.google.com/maps/search/?api=1&query=${currentPosition.latitude},${currentPosition.longitude}";
                    try {
                      await launchUrlString(url);
                      setState(() {
                        isloadig = false;
                      });
                    } catch (e) {
                      throw Exception(e.toString());
                    }
                  },
                  icon: Icon(
                    Icons.location_on_rounded,
                    color: Colors.white,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<GetPrayTimeCubit>(context)
                        .getpraytimes(indexday);
                  },
                  icon: Icon(
                    Icons.replay_outlined,
                    color: Colors.white,
                    size: 28,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(color: Color(0xfff5f5f5), boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.11,
                    );
                  },
                  itemBuilder: (context, index) {
                    return DayNoAndText(
                      isActive: currentindex == index ? true : false,
                      textup:
                          "${GetDataServices().getDayNamePrayTimePage(days[index])}",
                      textdown: "${days[index].day}",
                      onTap: () {
                        setState(() {
                          indexday = days[index];
                        });
                        BlocProvider.of<GetPrayTimeCubit>(context)
                            .getpraytimes(days[index]);
                        setState(() {
                          currentindex = index;
                          day = days[index];
                        });
                      },
                    );
                  },
                )),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مواقيت الصلاة ليوم ${GetDataServices().getArabicDayNmeforPrayTimePage(day)}",
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      GetDataServices().getHigriDateforPrayTimePage(day),
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    BlocBuilder<GetPrayTimeCubit, GetPrayTimeState>(
                      builder: (context, state) {
                        if (state is GetPrayTimeSucess) {
                          List praynames = [
                            state.prayerNames[0],
                            state.prayerNames[1],
                            state.prayerNames[2],
                            state.prayerNames[3],
                            state.prayerNames[4],
                            state.prayerNames[6],
                          ];
                          List praytimes = [
                            state.prayerTimes[0],
                            state.prayerTimes[1],
                            state.prayerTimes[2],
                            state.prayerTimes[3],
                            state.prayerTimes[4],
                            state.prayerTimes[6],
                          ];
                          return Expanded(
                              child: ListView.builder(
                            itemCount: praytimes.length,
                            itemBuilder: (context, index) {
                              return CustomComPrayTime(
                                  prayname: "${getarabic(praynames[index])}",
                                  praytime: "${praytimes[index]}",
                                  image: images[index]);
                            },
                          ));
                        } else if (state is GetPrayTimeLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: kPrimaryCOlor,
                          ));
                        } else if (state is GetPrayTimeFailure) {
                          return NoLocationAcess();
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            color: kPrimaryCOlor,
                          ));
                        }
                      },
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

String getarabic(String text) {
  if (text == 'Fajr') {
    return "الفجر";
  } else if (text == 'Sunrise') {
    return 'الضحي';
  } else if (text == 'Dhuhr') {
    return 'الظهر';
  } else if (text == 'Asr') {
    return 'العصر';
  } else if (text == 'Sunset') {
    return 'المغرب';
  } else if (text == 'Isha') {
    return 'العشاء';
  } else {
    return '';
  }
}
