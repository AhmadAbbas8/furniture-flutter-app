part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String errorMessage;

  const ProductError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ProductSuccess extends ProductState {
  final List<Product> product;

  const ProductSuccess({required this.product});

  @override
  List<Object> get props => [product];
}