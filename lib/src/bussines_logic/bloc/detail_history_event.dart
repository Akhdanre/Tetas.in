part of 'detail_history_bloc.dart';

class DetailHistoryEvent {}

class UpdateDataDetail extends DetailHistoryEvent {
  int id;

  UpdateDataDetail({required this.id});
}
