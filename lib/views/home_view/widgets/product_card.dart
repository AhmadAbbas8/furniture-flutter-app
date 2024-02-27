import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';
import 'package:furniture_flutter_app/models/models/product_model.dart';

import '../../../core/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145.w,
        decoration: BoxDecoration(
          color: ColorsPalette.kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: AssetsManager.spinner,
                    image: product.image,
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeInQuart,
                    fadeOutCurve: Curves.bounceInOut,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TitleText(title: product.title),
              ),
              SizedBox(height: 5),
              Text("\$${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
