import 'package:apigiris/view/show_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({
    super.key,
    required this.product,

  });

  final  product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(product["id"]);
        Get.to(()=>ShowProduct(product: product,));//fdffdfdf

      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(

          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              product['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product['category']),
            SizedBox(height: 5),
            Text(
              '\$${product['price'].toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}