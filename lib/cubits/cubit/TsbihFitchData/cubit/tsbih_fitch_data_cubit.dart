import 'package:athkar/models/tsbih_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'tsbih_fitch_data_state.dart';

class TsbihFitchDataCubit extends Cubit<TsbihFitchDataState> {
  TsbihFitchDataCubit() : super(TsbihFitchDataInitial());
  List<TsbihModel>? tsbih;
  fetchalltsbih() {
    var tsbihBox = Hive.box<TsbihModel>('tsbihh_box');
    tsbih = tsbihBox.values.toList();
    emit(TsbihFitchSucess());
  }
}
