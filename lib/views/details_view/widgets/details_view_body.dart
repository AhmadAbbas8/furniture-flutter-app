import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/models/product_model.dart';
import 'product_description.dart';
import 'product_info.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            ProductInfo(product: product),
            Positioned(
              top: 310,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 45.h,
              right: -30.w,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  height: 300.h,
                  width: 300.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
