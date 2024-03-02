import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/AddTsbihCubit/add_tsbih_cubit_cubit.dart';
import 'package:athkar/cubits/cubit/TsbihFitchData/cubit/tsbih_fitch_data_cubit.dart';
import 'package:athkar/models/tsbih_model.dart';

import 'package:athkar/views/addtsbih_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasbahaBody extends StatefulWidget {
  const MasbahaBody({super.key});

  @override
  State<MasbahaBody> createState() => _MasbahaBodyState();
}

class _MasbahaBodyState extends State<MasbahaBody> {
  late List<TsbihModel> tsbihlist;
  int index = 0;
  int counter = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TsbihFitchDataCubit>(context).fetchalltsbih();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TsbihFitchDataCubit, TsbihFitchDataState>(
      builder: (context, state) {
        tsbihlist = BlocProvider.of<TsbihFitchDataCubit>(context).tsbih ?? [];
        if (tsbihlist.isEmpty) {
          tsbihlist = [
            TsbihModel(count: 100, content: "سُبْحَانَ اللَّهِ"),
            TsbihModel(
                count: 100, content: "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ"),
            TsbihModel(count: 100, content: "أستغفر الله"),
            TsbihModel(count: 100, content: "لَا إِلَهَ إِلَّا اللَّهُ"),
            TsbihModel(count: 100, content: "الْلَّهُ أَكْبَرُ"),
          ];
          tsbihlist.forEach((element) {
            BlocProvider.of<AddTsbihCubitCubit>(context).addTsbih(element);
          });
          return Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "المسبحة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                      },
                      icon: Icon(
                        Icons.replay_circle_filled_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<TsbihFitchDataCubit>(context)
                            .fetchalltsbih();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTsbihView()));
                      },
                      icon: Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
              Spacer(),
              Text(
                "${tsbihlist[index].content}",
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    color: Colors.white,
                    fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "عدد التسبيحات: ${tsbihlist[index].count} مرة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "اجمالي مرات التسبيح: ${counter}",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (counter < (tsbihlist[index].count) - 1) {
                          counter++;
                        } else {
                          if (index + 1 == tsbihlist.length) {
                            index = 0;
                          } else {
                            index++;
                          }
                          counter = 0;
                        }
                      });
                    },
                    child: Image.asset(
                      "assets/ornament.png",
                      color: Colors.white,
                      width: 380,
                    ),
                  ),
                  Positioned.fill(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (counter < (tsbihlist[index].count) - 1) {
                          counter++;
                        } else {
                          if (index + 1 == tsbihlist.length) {
                            index = 0;
                          } else {
                            index++;
                          }
                          index++;
                          counter = 0;
                        }
                      });
                    },
                    child: Center(
                        child: Text(
                      "${counter}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    )),
                  ))
                ],
              ),
              Spacer()
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "المسبحة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                      },
                      icon: Icon(
                        Icons.replay_circle_filled_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<TsbihFitchDataCubit>(context)
                            .fetchalltsbih();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTsbihView()));
                      },
                      icon: Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
              Spacer(),
              Text(
                "${tsbihlist[index].content}",
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    color: Colors.white,
                    fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "عدد التسبيحات: ${tsbihlist[index].count} مرة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "اجمالي مرات التسبيح: ${counter}",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (counter < (tsbihlist[index].count) - 1) {
                          counter++;
                        } else {
                          if (index + 1 == tsbihlist.length) {
                            index = 0;
                          } else {
                            index++;
                          }
                          counter = 0;
                        }
                      });
                    },
                    child: Image.asset(
                      "assets/ornament.png",
                      color: Colors.white,
                      width: 380,
                    ),
                  ),
                  Positioned.fill(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (counter < (tsbihlist[index].count) - 1) {
                          counter++;
                        } else {
                          if (index + 1 == tsbihlist.length) {
                            index = 0;
                          } else {
                            index++;
                          }
                          counter = 0;
                        }
                      });
                    },
                    child: Center(
                        child: Text(
                      "${counter}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    )),
                  ))
                ],
              ),
              Spacer()
            ],
          );
        }
      },
    );
  }
}
