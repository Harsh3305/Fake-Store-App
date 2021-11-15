import 'package:fake_store/models/cart_product.dart';

class Cart {
  final String userID;
  final String date;
  final List<CartProduct> products;

  Cart({
    required this.userID,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> dynamicList) {
    var products = dynamicList["products"];
    var categories = products
        .map<CartProduct>((json) => CartProduct.fromJson(json))
        .toList();
    return Cart(
        userID: dynamicList["userId"],
        date: dynamicList["date"],
        products: categories);
  }
}
