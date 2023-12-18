part of 'detail_history_bloc.dart';

class DetailHistoryState {}

final class DetailHistoryInitial extends DetailHistoryState {}

final class DetailHistoryUpdate extends DetailHistoryState {
  List<DetailHatchModel> data;
  DetailHistoryUpdate({required this.data});
}
