part of 'history_bloc.dart';

class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryData extends HistoryState {
  List<EggIncubator> data;

  HistoryData({required this.data});
}
