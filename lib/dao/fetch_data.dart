import 'package:fake_store/models/product.dart';

import 'fetch_data_from_network/fetch_data_from_internet.dart';

class FetchData {
  static Future<List<Product>> fetchAllProducts() async {
    return FetchDataFromInternet.fetchAllProducts();
  }

  static Future<Product> fetchSingleProduct(int index) async {
    return FetchDataFromInternet.fetchSingleProduct(index);
  }
}
