import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_flutter_app/models/models/category_model.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/categories.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/category_card.dart';

import '../../../core/widgets/title_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
      ],
    );
  }
}
