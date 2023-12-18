part of 'history_bloc.dart';

class HistoryEvent {}

final class HistoryDataEvent extends HistoryEvent {
  List<EggIncubator> data;

  HistoryDataEvent({required this.data});
}
