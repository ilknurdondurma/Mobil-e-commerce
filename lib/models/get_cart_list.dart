class Cart {
  static List<Map<String, dynamic>> cartItems = [];

  static void addToCart(Map<String, dynamic> product) {
    cartItems.add({
      'product': product,
      'quantity': 1,
    });
    print(cartItems);
  }

  static void increaseQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index]['quantity']++;
    }
  }

  static void decreaseQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    }
  }


    static double calculateTotalPrice() {
      double totalPrice = 0;

      for (final item in Cart.cartItems) {
        final product = item['product'];
        final quantity = item['quantity'];
        final price = product['price'];

        totalPrice += quantity * price;
      }

      return totalPrice;
    }

}
