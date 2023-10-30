part of 'populer_bloc.dart';

sealed class PopulerEvent extends Equatable {
  const PopulerEvent();
}

class GetNewsPopulerEvent extends PopulerEvent {
  @override
  List<Object> get props => [];
}
