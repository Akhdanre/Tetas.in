part of 'inku_info_bloc.dart';

@immutable
abstract class InkuInfoEvent {}

class SendDataEvent extends InkuInfoEvent {
  final Map<String, dynamic> data;

  SendDataEvent(this.data);
}
