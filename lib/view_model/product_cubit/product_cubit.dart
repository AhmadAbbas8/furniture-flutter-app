import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_flutter_app/models/models/product_model.dart';
import 'package:furniture_flutter_app/models/products_repo.dart';

import '../../core/error/failure.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo,
        super(ProductLoading());

  final ProductsRepo _productsRepo;

  fetchProducts() async {
    var res = await _productsRepo.fetchProducts();
    res.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(const ProductError(errorMessage: 'Server Failure 😞'));
        } else {
          emit(const ProductError(
              errorMessage: 'Check your internet connection ⚠'));
        }
      },
      (products) => emit(ProductSuccess(product: products)),
    );
  }
}
