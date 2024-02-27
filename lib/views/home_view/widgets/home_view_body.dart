
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';

import 'package:furniture_flutter_app/models/models/category_model.dart';
import 'package:furniture_flutter_app/models/models/product_model.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/categories.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/recommendation_products.dart';
import '../../../core/widgets/title_text.dart';
import '../../../view_model/categories_cubit/categories_cubit.dart';

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
          RecommendationProducts(
            products: [
              productDemo,
            ],
          )
        ],
      ),
    );
  }
}
