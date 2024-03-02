import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/getpraytimeCubit/cubit/get_pray_time_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "لا يوجد اتصال بالانترنت",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "من فضلك تحقق من اتصالك بالانترنت",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryCOlor)),
              onPressed: () async {
                ConnectivityResult result =
                    await Connectivity().checkConnectivity();
                if (result == ConnectivityResult.none) {
                  var sna = SnackBar(
                    backgroundColor: kPrimaryCOlor,
                    content: Row(
                      children: [
                        Icon(
                          Icons.signal_wifi_connected_no_internet_4_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'من فضلك تحقق من الاتصال بالانترنت ثم اعد المحاولة',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(sna);
                } else {
                  BlocProvider.of<GetPrayTimeCubit>(context)
                      .getpraytimes(DateTime.now());
                }
              },
              child: Text(
                'اعادة المحاولة',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
