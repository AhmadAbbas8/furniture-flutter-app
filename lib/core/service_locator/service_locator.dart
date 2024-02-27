import 'package:dio/dio.dart';
import 'package:furniture_flutter_app/models/products_repo_Impl.dart';
import 'package:furniture_flutter_app/models/products_repo.dart';
import 'package:furniture_flutter_app/view_model/categories_cubit/categories_cubit.dart';
import 'package:furniture_flutter_app/view_model/product_cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/api/api_consumer.dart';
import '../network/api/dio_consumer.dart';
import '../network/network_info.dart';
import '../utils/end_points.dart';

class ServiceLocator {
  ServiceLocator._();

  static final instance = GetIt.instance;

  static Future<void> setup() async {
    // * Core

    instance.registerLazySingleton<NetworkInfo>(
        () => NetWorkInfoImpl(InternetConnectionChecker.createInstance()));
    instance.registerLazySingleton<ApiConsumer>(() => DioConsumer(
            dio: Dio(BaseOptions(
          baseUrl: EndPoints.BASE_URL,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
          },
        ))));

    // * Repository
    instance.registerLazySingleton<ProductsRepo>(() =>
        ProductsRepoImpl(apiConsumer: instance(), networkInfo: instance()));

    // * Bloc/Cubit
    instance.registerFactory(() => CategoriesCubit(productsRepo: instance()));
    instance.registerFactory(() => ProductCubit(productsRepo: instance()));
  }
}
