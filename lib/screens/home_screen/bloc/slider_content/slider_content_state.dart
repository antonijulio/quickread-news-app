part of 'slider_content_bloc.dart';

sealed class SliderContentState extends Equatable {
  const SliderContentState();
}

final class SliderContentLoadingState extends SliderContentState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class SliderContentSuccesState extends SliderContentState {
  final NewsModel newsModel;

  const SliderContentSuccesState({required this.newsModel});

  @override
  List<Object?> get props => [newsModel];
}

final class SliderContentEmptyState extends SliderContentState {
  @override
  List<Object?> get props => [];
}

final class SliderContentErrorState extends SliderContentState {
  final String errorMessage;

  const SliderContentErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
