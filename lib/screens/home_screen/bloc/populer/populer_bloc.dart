// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickread/model/populer_model.dart';
import 'package:quickread/service/popler_service.dart';

part 'populer_event.dart';
part 'populer_state.dart';

class PopulerBloc extends Bloc<PopulerEvent, PopulerState> {
  PopulerBloc() : super(PopulerNewsLoadingState()) {
    on<PopulerEvent>((event, emit) async {
      emit(PopulerNewsLoadingState());
      try {
        final newsData = await PopulerService().getPopulerNews();

        if (newsData.articles?.results?.isNotEmpty == true) {
          emit(PopulerNewsLoadedState(newsData: newsData));
        } else {
          emit(PopulerNewsEmptyState());
        }
      } catch (e) {
        emit(PopulerNewsErrorState());
      }
    });
  }
}
