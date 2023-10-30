part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoryEvent extends CategoryEvent {
  final String id;

  const GetCategoryEvent({required this.id});

  @override
  List<Object> get props => [id];
}
