part of 'slider_content_bloc.dart';

sealed class SliderContentEvent extends Equatable {
  const SliderContentEvent();
}

class GetSliderContentEvent extends SliderContentEvent {
  @override
  List<Object> get props => [];
}
