import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_flutter_app/core/error/failure.dart';
import 'package:furniture_flutter_app/models/products_repo.dart';

import '../../models/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo,
        super(CategoriesLoading());
  final ProductsRepo _productsRepo;

  fetchCategories() async {
    var res = await _productsRepo.fetchCategories();
    res.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(const CategoriesError(errorMessage: 'Server Failure 😞'));
        } else {
          emit(const CategoriesError(
              errorMessage: 'Check your internet connection ⚠'));
        }
      },
      (categories) => emit(CategoriesSuccess(categories: categories)),
    );
  }
}
