import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/title_text.dart';
import '../../../view_model/categories_cubit/categories_cubit.dart';
import '../../../view_model/product_cubit/product_cubit.dart';
import 'categories.dart';
import 'recommendation_products.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: TitleText(
              title: "Browse by Categories",
            ),
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccess) {
                return Categories(
                  categories: state.categories,
                );
              } else if (state is CategoriesError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Center(
                  child: Image.asset(AssetsManager.ripple),
                );
              }
            },
          ),
          const Divider(height: 5),
          const Padding(
            padding: EdgeInsets.all(20), //20
            child: TitleText(title: "Recommands For You"),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccess) {
                return RecommendationProducts(
                  products: state.product,
                );
              } else if (state is ProductError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Center(
                  child: Image.asset(AssetsManager.ripple),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
