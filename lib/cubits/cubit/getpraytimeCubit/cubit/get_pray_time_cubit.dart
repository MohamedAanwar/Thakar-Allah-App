import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:pray_times/pray_times.dart';

part 'get_pray_time_state.dart';

class GetPrayTimeCubit extends Cubit<GetPrayTimeState> {
  GetPrayTimeCubit() : super(GetPrayTimeInitial());

  getpraytimes(DateTime datee) async {
    emit(GetPrayTimeLoading());
    await Geolocator.requestPermission();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      emit(GetPrayTimeFailure());
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      try {
        double latitude = currentPosition.latitude;
        double longitude = currentPosition.longitude;
        double timezone = 2;

        PrayerTimes prayers = PrayerTimes();
        prayers.setTimeFormat(prayers.Time12);
        prayers.setCalcMethod(prayers.Egypt);
        prayers.setAsrJuristic(prayers.Shafii);
        prayers.setAdjustHighLats(prayers.AngleBased);
        var offsets = [0, 0, 0, 0, 0, 0, 0];
        prayers.tune(offsets);

        final date = datee;
        List<String> prayertimes =
            prayers.getPrayerTimes(date, latitude, longitude, timezone);
        List<String> prayernames = prayers.getTimeNames();
        emit(GetPrayTimeSucess(
            prayerNames: prayernames,
            prayerTimes: prayertimes,
            lat: currentPosition.latitude,
            long: currentPosition.longitude));
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
