import 'package:apigiris/UIhelper/constant/ui_colors.dart';
import 'package:apigiris/UIhelper/constant/ui_text.dart';
import 'package:apigiris/UIhelper/myWidgets/my_button.dart';
import 'package:apigiris/appbar.dart';
import 'package:apigiris/models/get_cart_list.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "SEPETİM\n${Cart.cartItems.length} ürün"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Cart.cartItems.length,
              itemBuilder: (context, index) {
                final item = Cart.cartItems[index];
                final product = item['product'];
                int quantity = item['quantity'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColors.appBarBackgroundColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width*0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              leading: Image.network(
                                product['image'],
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(product['title']),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '\$${product['price'].toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width*0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Cart.decreaseQuantity(index);
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Cart.increaseQuantity(index);
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.051,

                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Toplam: \$${Cart.calculateTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                    MyIconButtonWidget(
                      buttonText: UIText.buyText,
                        icon: Icons.credit_card,
                        color: UIColors.appBarBackgroundColor,
                        size: 30,
                        onPressed: ()=>null)
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}



