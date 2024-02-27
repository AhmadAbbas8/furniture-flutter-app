import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_flutter_app/core/service_locator/service_locator.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';

import '../../view_model/categories_cubit/categories_cubit.dart';
import '../../view_model/product_cubit/product_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ServiceLocator.instance<CategoriesCubit>()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) =>
              ServiceLocator.instance<ProductCubit>()..fetchProducts(),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(),
        body: const HomeViewBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          AssetsManager.menu,
          height: 20.h,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AssetsManager.scan,
            height: 24.h, //24
          ),
          onPressed: () {},
        ),
        const Text(
          "Scan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsPalette.kTextColor,
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
