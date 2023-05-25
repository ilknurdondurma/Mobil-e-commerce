
import 'package:apigiris/UIhelper/constant/ui_text.dart';
import 'package:apigiris/appbar.dart';
import 'package:apigiris/data/api/fetchdata.dart';

import 'package:flutter/material.dart';
import '../UIhelper/myWidgets/list_of_category.dart';
import '../UIhelper/myWidgets/list_of_product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List categories = [];
  List products = [];
  String selectedCategory = 'All';


  @override
  void initState() {
    super.initState();
    _fetchCategories();
    _fetchProducts();
  }
  Future<void> _fetchCategories() async {
    try {
      final response = await ProductService.getCategories();
      setState(() {
        categories = response;
      });
    } catch (e) {
      print('Failed to fetch products: $e');
    }
  }
  Future<void> _fetchProducts() async {
    try {
      final response = await ProductService.getProducts();
      setState(() {
        products = response;
      });
    } catch (e) {
      print('Failed to fetch products: $e');
    }
  }
  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  List getFilteredProducts() {
    return selectedCategory == 'All'
        ? products
        : products.where((product) => product['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: UIText.appBarText),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListOfCategory(
              categories: categories,
              onCategorySelected: onCategorySelected,
            ),
            SizedBox(height: 10),
            ListOfProduct(products: getFilteredProducts()),
          ],
        ),
      ),
    );
  }

}





