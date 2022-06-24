part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategories extends CategoryEvent {}

class SearchByCategory extends CategoryEvent {
  final String categoryName;
  const SearchByCategory({
    required this.categoryName,
  });
}
