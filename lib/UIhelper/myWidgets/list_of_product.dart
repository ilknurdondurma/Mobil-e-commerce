
import 'package:flutter/material.dart';

import 'container_of_product.dart';


class ListOfProduct extends StatelessWidget {
  const ListOfProduct({
    super.key,
    required this.products,
  });

  final List products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // İki sütunlu bir grid
        childAspectRatio: 1, // Kutu en-boy oranı 1
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductsContainer(product: product);//sdsds
      },
    );
  }
}
