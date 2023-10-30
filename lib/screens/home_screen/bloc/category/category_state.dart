part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoadedState extends CategoryState {
  final NewsModel categoryData;

  const CategoryLoadedState({required this.categoryData});

  @override
  List<Object> get props => [categoryData];
}

final class CategoryEmptyState extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryErrorState extends CategoryState {
  @override
  List<Object> get props => [];
}
