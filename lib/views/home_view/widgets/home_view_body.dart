import 'package:flutter/material.dart';

import 'package:furniture_flutter_app/models/models/category_model.dart';
import 'package:furniture_flutter_app/models/models/product_model.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/categories.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/recommendation_products.dart';
import '../../../core/widgets/title_text.dart';

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
          Categories(
            categories: [
              categoryDemo,
              categoryDemo,
              categoryDemo,
            ],
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
