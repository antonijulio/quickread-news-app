import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quickread/model/populer_model.dart';
import 'package:quickread/service/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SerachLoadingState()) {
    on<GetSearchEvent>((event, emit) async {
      emit(SerachLoadingState());
      try {
        final newsData =
            await SearchService().getSearchNews(text: event.text.text);

        if (newsData.articles?.results?.isNotEmpty == true) {
          emit(SerachSuccesState(newsData: newsData));
        } else {
          emit(SearchEmptyState());
        }
      } catch (e) {
        emit(SearchErrorState());
      }
    });
  }
}
