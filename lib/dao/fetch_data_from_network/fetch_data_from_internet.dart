import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fake_store/models/product.dart';

class FetchDataFromInternet {
  static const String baseUrl = "https://fakestoreapi.com/";
  static Future<List<Product>> fetchAllProducts() async {
    String url = baseUrl + "products";
    var products = <Product>[];
    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);

    products =
        jsonProducts.map<Product>((json) => Product.fromJson(json)).toList();
    return products;
  }

  static Future<Product> fetchSingleProduct(int index) async {
    String url = baseUrl + "products/$index";
    // var products = <Product>[];
    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);

    var products = Product.fromJson(jsonProducts);
    return products;
  }
}
