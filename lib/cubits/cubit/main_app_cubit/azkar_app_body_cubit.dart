import 'package:flutter_bloc/flutter_bloc.dart';

part 'azkar_app_body_state.dart';

class AzkarAppBodyCubit extends Cubit<AzkarAppBodyState> {
  AzkarAppBodyCubit() : super(AzkarAppBodyInitial());

  getfirstpage() {
    emit(AzkarAppBodyInitial());
  }

  getsecondpage() {
    emit(AzkarAppBodyPrayer());
  }

  getlastpage() {
    emit(AzkarAppBodyMore());
  }

  getfourthpage() {
    emit(AzkarAppBodyRosary());
  }

  getfifthpage() {
    emit(AzkarAppBodyPrayTimes());
  }
}
