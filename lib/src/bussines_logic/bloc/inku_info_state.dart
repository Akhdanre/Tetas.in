part of 'inku_info_bloc.dart';

@immutable
sealed class InkuInfoState {}

final class InkuInfoInitial extends InkuInfoState {}

final class InkuInfosuccess extends InkuInfoState {}

final class InkuInfoException extends InkuInfoState {}
