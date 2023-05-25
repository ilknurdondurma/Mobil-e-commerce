import 'package:apigiris/UIhelper/constant/ui_colors.dart';
import 'package:apigiris/UIhelper/constant/ui_text.dart';
import 'package:apigiris/UIhelper/myWidgets/container_of_product.dart';
import 'package:apigiris/UIhelper/myWidgets/my_button.dart';
import 'package:apigiris/appbar.dart';
import 'package:flutter/material.dart';

import '../models/get_cart_list.dart';

class ShowProduct extends StatelessWidget {
  final Map<String, dynamic> product;

  const ShowProduct({Key? key, required this.product,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: UIText.appBarTextShowProduct),
      body: ShowDetailWidget(product: product),
    );
  }
}

class ShowDetailWidget extends StatelessWidget {
  const ShowDetailWidget({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.4, // Opaklık düşüklüğünü buradan ayarlayabilirsiniz
            child: Image.network(
              product['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product['title'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            product['category'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            product['image'],
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                          Text(
                            '${product['description']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: (){
                              Cart.addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Product added to cart')),
                              );
                            },
                            child: MyIconButtonWidget(
                                icon: Icons.shopping_cart,
                                color: UIColors.appBarBackgroundColor,
                                size: 50,
                                buttonText: UIText.addText,
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    );
  }
}
