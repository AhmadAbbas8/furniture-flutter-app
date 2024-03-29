import 'package:flutter/material.dart';
import 'package:furniture_flutter_app/core/helpers/extensions/navigation_extensions.dart';
import 'package:furniture_flutter_app/views/details_view/details_view.dart';

import '../../../models/models/product_model.dart';
import 'product_card.dart';

class RecommendationProducts extends StatelessWidget {
  const RecommendationProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onTap: () => context.push(DetailsView(product: products[index])),
        ),
      ),
    );
  }
}
