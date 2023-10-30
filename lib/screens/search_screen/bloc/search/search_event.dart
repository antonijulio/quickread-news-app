part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchEvent extends SearchEvent {
  final TextEditingController text;

  const GetSearchEvent({required this.text});
  @override
  List<Object> get props => [text];
}
