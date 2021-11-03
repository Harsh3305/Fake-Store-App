import 'package:fake_store/models/cart_product.dart';

class Cart {
  final int id;
  final int userID;
  final String date;
  final List<CartProduct> products;

  Cart({
    required this.id,
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
        id: dynamicList["id"],
        userID: dynamicList["userId"],
        date: dynamicList["date"],
        products: categories);
  }
}
