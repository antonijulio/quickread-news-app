import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickread/model/news_model.dart';
import 'package:quickread/service/category_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoadingState()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final categoryData = await CategoryService().getCategoryById(
          id: event.id,
        );

        if (categoryData.results?.isNotEmpty == true) {
          emit(CategoryLoadedState(categoryData: categoryData));
        } else {
          emit(CategoryEmptyState());
        }
      } catch (e) {
        emit(CategoryErrorState());
      }
    });
  }
}
