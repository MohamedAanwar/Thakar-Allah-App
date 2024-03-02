import 'package:athkar/const.dart';
import 'package:athkar/models/godnames.dart';
import 'package:athkar/services/getdata.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GodNamesView extends StatefulWidget {
  const GodNamesView({super.key});

  @override
  State<GodNamesView> createState() => _GodNamesViewState();
}

class _GodNamesViewState extends State<GodNamesView> {
  List<GodNamesModel> godnames = [];
  bool ispressed = false;
  ScrollController cont = ScrollController();
  AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    getgodnames();
  }

  Future<void> getgodnames() async {
    godnames = await GetDataServices().getGodNames();
    setState(() {});
  }

  toggle() async {
    if (ispressed) {
      player.pause();
      setState(() {
        ispressed = false;
      });
    } else {
      await player.play(AssetSource("audio/godnames.wav"));
      setState(() {
        ispressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cont.animateTo(
                0,
                duration: Duration(seconds: 2),
                curve: Curves.easeOut,
              );
            },
            child: Icon(
              Icons.arrow_upward_rounded,
              color: kPrimaryCOlor,
            ),
          ),
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                'أسماء الله الحسني',
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    color: kPrimaryCOlor,
                    fontSize: 20),
              ),
              backgroundColor: Color(0xfff5f5f5),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () async {
                      if (ispressed) {
                        await player.stop();
                        setState(() {
                          ispressed = false;
                        });
                      } else {
                        await toggle();
                      }
                    },
                    icon: Icon(
                      ispressed ? Icons.pause_circle : Icons.play_circle,
                      color: kPrimaryCOlor,
                    )),
                IconButton(
                    onPressed: () {
                      player.stop();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kPrimaryCOlor,
                    )),
              ]),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: GridView.builder(
                controller: cont,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 6, crossAxisSpacing: 6),
                itemCount: godnames.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(color: kPrimaryCOlor, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          godnames[index].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: kPrimaryFont,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            godnames[index].text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
