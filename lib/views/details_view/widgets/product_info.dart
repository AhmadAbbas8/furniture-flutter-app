import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';

import '../../../models/models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    TextStyle lightTextStyle = TextStyle(
      color: ColorsPalette.kTextColor.withOpacity(0.6),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 300.h,
      width: 165.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(product.category.toUpperCase(), style: lightTextStyle),
            SizedBox(height: 20.h),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: 20.h),
            Text("Form", style: lightTextStyle),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: 20.h),
            Text("Available Colors", style: lightTextStyle),
            Row(
              children: <Widget>[
                buildColorBox(
                  color: const Color(0xFF7BA275),
                  isActive: true,
                ),
                buildColorBox(
                  color: const Color(0xFFD7D7D7),
                ),
                buildColorBox(
                  color: ColorsPalette.kTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorBox({
    Color? color,
    bool isActive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 5),
      padding: const EdgeInsets.all(5),
      height: 30.w,
      width: 30.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child:
          isActive ? SvgPicture.asset(AssetsManager.check) : const SizedBox(),
    );
  }
}
