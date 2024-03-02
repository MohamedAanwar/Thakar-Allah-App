part of 'add_tsbih_cubit_cubit.dart';

sealed class AddTsbihCubitState {}

final class AddTsbihCubitInitial extends AddTsbihCubitState {}

final class AddTsbihSucess extends AddTsbihCubitState {}

final class AddTsbihFailure extends AddTsbihCubitState {}

final class AddTsbihLoading extends AddTsbihCubitState {}
