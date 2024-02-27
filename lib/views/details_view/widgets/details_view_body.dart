import 'package:flutter/cupertino.dart';

import '../../../models/models/product_model.dart';
import 'product_info.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
