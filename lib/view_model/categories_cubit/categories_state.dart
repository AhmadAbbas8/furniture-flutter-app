part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesLoading extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String errorMessage;

  const CategoriesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;

  const CategoriesSuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}
