import 'package:dartz/dartz.dart';

import '../core/error/failure.dart';
import '../core/network/api/api_consumer.dart';
import '../core/network/network_info.dart';
import '../core/utils/end_points.dart';
import 'models/category_model.dart';
import 'models/product_model.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiConsumer _apiConsumer;
  final NetworkInfo _networkInfo;

  ProductsRepoImpl({
    required ApiConsumer apiConsumer,
    required NetworkInfo networkInfo,
  })  : _apiConsumer = apiConsumer,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<Category>>> fetchCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiConsumer.get(EndPoints.categories);
        List<Category> categories = [];
        for (var val in response) {
          categories.add(Category.fromJson(val));
        }
        return Right(categories);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _apiConsumer.get(EndPoints.products);
        List<Product> products = [];
        for (var val in response) {
          products.add(Product.fromJson(val));
        }
        return Right(products);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
