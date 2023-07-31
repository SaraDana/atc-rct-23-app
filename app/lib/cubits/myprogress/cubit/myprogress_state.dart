part of 'myprogress_cubit.dart';

@immutable
abstract class MyprogressState {}

class MyprogressInitial extends MyprogressState {}

class MyprogressLoading extends MyprogressState {}

class MyprogressError extends MyprogressState {}

class MyprogressLoaded extends MyprogressState {
  int userWeek;
  List<WeekModel> sectios;
  MyprogressLoaded({required this.userWeek, required this.sectios}) : super();
}
