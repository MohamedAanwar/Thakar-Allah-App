import 'package:athkar/models/tsbih_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'add_tsbih_cubit_state.dart';

class AddTsbihCubitCubit extends Cubit<AddTsbihCubitState> {
  AddTsbihCubitCubit() : super(AddTsbihCubitInitial());
  addTsbih(TsbihModel tsbih) async {
    emit(AddTsbihLoading());
    try {
      var tsbihbox = Hive.box<TsbihModel>('tsbihh_box');

      await tsbihbox.add(tsbih);
      emit(AddTsbihSucess());
    } catch (e) {
      emit(AddTsbihFailure());
    }
  }
}
