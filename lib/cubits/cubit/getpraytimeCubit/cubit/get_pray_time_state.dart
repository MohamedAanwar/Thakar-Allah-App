part of 'get_pray_time_cubit.dart';

sealed class GetPrayTimeState {}

final class GetPrayTimeInitial extends GetPrayTimeState {}

final class GetPrayTimeFailure extends GetPrayTimeState {}

final class GetPrayTimeSucess extends GetPrayTimeState {
  final List<String> prayerTimes;
  final List<String> prayerNames;
  final double long;
  final double lat;

  GetPrayTimeSucess({
    required this.prayerTimes,
    required this.prayerNames,
    required this.long,
    required this.lat,
  });
}

final class GetPrayTimeLoading extends GetPrayTimeState {}
