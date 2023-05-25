import 'dart:convert';
import 'package:apigiris/data/api/api_urls.dart';
import 'package:http/http.dart' as http;

class ProductService {

  static Future<dynamic> getCategories() async {
    final response = await http.get(Uri.parse(get_all_categories_api_url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }


  static Future<dynamic> getProducts() async {
    final response = await http.get(Uri.parse(get_all_products_api_url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

}