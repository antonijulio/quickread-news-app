part of 'populer_bloc.dart';

sealed class PopulerState extends Equatable {
  const PopulerState();
}

final class PopulerNewsLoadingState extends PopulerState {
  @override
  List<Object> get props => [];
}

final class PopulerNewsLoadedState extends PopulerState {
  final PopulerModel newsData;

  const PopulerNewsLoadedState({required this.newsData});
  @override
  List<Object> get props => [newsData];
}

final class PopulerNewsEmptyState extends PopulerState {
  @override
  List<Object> get props => [];
}

final class PopulerNewsErrorState extends PopulerState {
  @override
  List<Object> get props => [];
}
