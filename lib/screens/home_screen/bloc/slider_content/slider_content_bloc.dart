// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickread/model/news_model.dart';
import 'package:quickread/service/news_service.dart';

part 'slider_content_event.dart';
part 'slider_content_state.dart';

class SliderContentBloc extends Bloc<SliderContentEvent, SliderContentState> {
  final newsData = NewsService().getNews();
  SliderContentBloc() : super(SliderContentLoadingState()) {
    on<GetSliderContentEvent>((event, emit) async {
      emit(SliderContentLoadingState());

      try {
        final sliderData = await NewsService().getNews();

        if (sliderData.results?.isNotEmpty == true) {
          emit(
            SliderContentSuccesState(newsModel: sliderData),
          );
        } else {
          emit(SliderContentEmptyState());
        }
      } catch (e) {
        emit(
          const SliderContentErrorState(
            errorMessage: "Error: Terjadi kesalahan!",
          ),
        );
      }
    });
  }
}
