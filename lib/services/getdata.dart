import 'dart:convert';

import 'package:athkar/models/azkar_model.dart';
import 'package:athkar/models/general_model.dart';
import 'package:athkar/models/godnames.dart';

import 'package:flutter/services.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class GetDataServices {
  Future<List<AzkarModel>> getMorningAzkar(
      String azkartype, String filename) async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/$filename.json');
    Map<String, dynamic> jsondata = json.decode(jsonstring);
    List<AzkarModel> morningAzkarList = [];
    for (var element in jsondata[azkartype]) {
      morningAzkarList.add(AzkarModel.fromJson(element));
    }
    return morningAzkarList;
  }

  Future<List<AzkarModel>> getRoqia(String filename) async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/$filename.json');
    List<dynamic> jsondata = json.decode(jsonstring);
    List<AzkarModel> morningAzkarList = [];
    for (var element in jsondata) {
      morningAzkarList.add(AzkarModel.fromJsonRoqia(element));
    }
    return morningAzkarList;
  }

  Future<List<GodNamesModel>> getGodNames() async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/Names_Of_Allah.json');
    List<dynamic> jsondata = json.decode(jsonstring);
    List<GodNamesModel> GodNamesList = [];
    for (var element in jsondata) {
      GodNamesList.add(GodNamesModel.fromJson(element));
    }
    return GodNamesList;
  }

  Future<List<GeneralModel>> getgeneraltext(String type) async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/$type.json');
    List<dynamic> jsondata = json.decode(jsonstring);
    List<GeneralModel> generallist = [];
    for (var element in jsondata) {
      generallist.add(GeneralModel.fromJsonText(element));
    }
    return generallist;
  }

  Future<List<GeneralModel>> getgeneraltext_hint_number(String type) async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/$type.json');
    List<dynamic> jsondata = json.decode(jsonstring);
    List<GeneralModel> generallist = [];
    for (var element in jsondata) {
      generallist.add(GeneralModel.fromJsonText_number_hint(element));
    }
    return generallist;
  }

  Future<List<GeneralModel>> getgeneraltext_label_number(String type) async {
    String jsonstring =
        await rootBundle.loadString('assets/jsonfiles/$type.json');
    List<dynamic> jsondata = json.decode(jsonstring);
    List<GeneralModel> generallist = [];
    for (var element in jsondata) {
      generallist.add(GeneralModel.fromJsonText_label_number(element));
    }
    return generallist;
  }

  String getHigriDate() {
    HijriCalendar.setLocal('ar');
    HijriCalendar today = HijriCalendar.now();
    String arabicdayname = today.toFormat("DDDD");
    String arabicmonthname = today.toFormat("MMMM");
    String day = NumberFormat('##', 'ar').format(today.hDay);
    String yaar = NumberFormat('####', 'ar').format(today.hYear);
    return '$arabicdayname، $arabicmonthname $day، $yaar';
  }

  String getHigriDateforPrayTimePage(DateTime date) {
    HijriCalendar.setLocal('ar');
    HijriCalendar today = HijriCalendar.fromDate(date);

    String arabicmonthname = today.toFormat("MMMM");
    String day = NumberFormat('##', 'ar').format(today.hDay);
    String yaar = NumberFormat('####', 'ar').format(today.hYear);
    return '$day $arabicmonthname $yaar ھ';
  }

  String getArabicDayNmeforPrayTimePage(DateTime date) {
    HijriCalendar.setLocal('ar');
    HijriCalendar today = HijriCalendar.fromDate(date);
    String arabicdayname = today.toFormat("DDDD");

    return arabicdayname;
  }

  String getDayNamePrayTimePage(DateTime date) {
    String dayname = DateFormat('E').format(date);

    return dayname;
  }
}
