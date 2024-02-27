import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';

import '../../models/models/product_model.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final Product product;

  const DetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.kSecondaryColor,
      appBar: buildAppBar(context),
      body: DetailsViewBody(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AssetsManager.arrowLongLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetsManager.bag),
            onPressed: () {},
          ),
          SizedBox(width: 20.w),
        ],
      );
}
