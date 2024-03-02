import 'package:athkar/cubits/cubit/AddTsbihCubit/add_tsbih_cubit_cubit.dart';
import 'package:athkar/cubits/cubit/TsbihFitchData/cubit/tsbih_fitch_data_cubit.dart';
import 'package:athkar/cubits/cubit/main_app_cubit/azkar_app_body_cubit.dart';
import 'package:athkar/cubits/cubit/getpraytimeCubit/cubit/get_pray_time_cubit.dart';
import 'package:athkar/models/tsbih_model.dart';
import 'package:athkar/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TsbihModelAdapter());
  await Hive.openBox<TsbihModel>('tsbihh_box');
  await Hive.openBox('book');
  await Hive.openBox('rait');
  runApp(const AzkarApp());
}

class AzkarApp extends StatelessWidget {
  const AzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AzkarAppBodyCubit()),
        BlocProvider(create: (context) => TsbihFitchDataCubit()),
        BlocProvider(create: (context) => AddTsbihCubitCubit()),
        BlocProvider(create: (context) => GetPrayTimeCubit()),
      ],
      child: MaterialApp(
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl, child: SplachView()),
      ),
    );
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('ar'),
    const Locale('ar'),
  ];
}
