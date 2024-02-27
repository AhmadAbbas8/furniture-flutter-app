import 'package:flutter/cupertino.dart';
import 'package:furniture_flutter_app/models/models/category_model.dart';
import 'package:furniture_flutter_app/views/home_view/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
         categories.length,
              (index) => CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
