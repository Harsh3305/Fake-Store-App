import 'dart:convert';
import 'dart:io';
import 'package:fake_store/models/cart.dart';
import 'package:fake_store/models/category.dart';
import 'package:fake_store/models/user/address.dart';
import 'package:fake_store/models/user/name.dart';
import 'package:fake_store/models/user/user.dart';
import 'package:fake_store/models/user_password.dart';
import 'package:http/http.dart' as http;
import 'package:fake_store/models/product.dart';

class FetchDataFromInternet {
  static const String baseUrl = "https://hrv-store-api.azurewebsites.net/api/";
  static Future<List<Product>> fetchAllProducts() async {
    String url = baseUrl + "products";

    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);

    var products =
        jsonProducts.map<Product>((json) => Product.fromJson(json)).toList();
    return products;
  }

  static Future<Product> fetchSingleProduct(int index) async {
    String url = baseUrl + "products/$index";
    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);
    var products = Product.fromJson(jsonProducts);
    return products;
  }

  static Future<List<Category>> fetchCategories() async {
    String url = baseUrl + "products/categories";
    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);
    var categories =
        jsonProducts.map<Category>((json) => Category.fromJson(json)).toList();
    return categories;
  }

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    String url = baseUrl + "products/category/$category";
    var response = await http.get(Uri.parse(url));
    var jsonProducts = json.decode(response.body);
    var categories =
        jsonProducts.map<Product>((json) => Product.fromJson(json)).toList();
    return categories;
  }

  static Future<Cart> fetchCart(String id) async {
    String url = baseUrl + "carts/getCart/$id";
    var response = await http.get(Uri.parse(url));
    var jsonCategory = json.decode(response.body);
    // var categories =
    //     jsonProducts.map<Cart>((json) => Cart.fromJson(json)).toList();
    var categories = Cart.fromJson(jsonCategory);
    return categories;
  }

  static Future<User> signUp(UserPassword userPassword) async {
    var url = "${baseUrl}user/addUser";
    var response = await http.post(Uri.parse(url), body: userPassword.toJson());
    var jsonProducts = json.decode(response.body);
    var user = User.fromJson(jsonProducts);
    return user;
  }

  static Future<User> login(UserPassword userPassword) async {
    var url = "${baseUrl}user/logInUser";
    var response = await http.post(Uri.parse(url), body: userPassword.toJson());
    var jsonProducts = json.decode(response.body);
    try {
      var user = User.fromJson(jsonProducts);
      return user;
    } catch (e) {
      var user = User(Address("", ""), "-1", "", "", Name("", ""), "", "", "");
      return user;
    }
  }
}
