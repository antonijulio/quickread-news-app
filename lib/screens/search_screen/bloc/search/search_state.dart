part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
}

final class SerachLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

final class SerachSuccesState extends SearchState {
  final PopulerModel newsData;

  const SerachSuccesState({required this.newsData});
  @override
  List<Object> get props => [newsData];
}

final class SearchEmptyState extends SearchState {
  @override
  List<Object> get props => [];
}

final class SearchErrorState extends SearchState {
  @override
  List<Object> get props => [];
}
