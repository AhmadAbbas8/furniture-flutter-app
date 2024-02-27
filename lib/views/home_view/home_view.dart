import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_flutter_app/core/utils/assets_manager.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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
