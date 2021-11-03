import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';

class CartProduct {
  final int productID;
  final int quantity;

  CartProduct({
    required this.productID,
    required this.quantity,
  });
  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
        productID: json["productId"], quantity: json["quantity"]);
  }
  Future<Product> convertToProduct() async {
    return FetchData.fetchSingleProduct(productID);
  }
}
