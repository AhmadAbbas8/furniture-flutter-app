import '../core/error/failure.dart';
import 'models/category_model.dart';
import 'models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<Category>>> fetchCategories();

  Future<Either<Failure, List<Product>>> fetchProducts();
}
