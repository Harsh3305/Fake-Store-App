import 'package:fake_store/models/cart.dart';
import 'package:fake_store/models/category.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/models/user/user.dart';
import 'package:fake_store/models/user_password.dart';

import 'fetch_data_from_cache/fetch_data_from_cache.dart';
import 'fetch_data_from_network/fetch_data_from_internet.dart';

class FetchData {
  static const String id = "5";
  static Future<List<Product>> fetchAllProducts() async {
    String key = "fetchAllProducts";
    Object? cacheStoreage = FetchDataFromCache.getFromCache(key);

    if (cacheStoreage == null) {
      Future<List<Product>> finalResult =
          FetchDataFromInternet.fetchAllProducts();
      FetchDataFromCache.storeInCache(key, finalResult);
      return finalResult;
    } else {
      return FetchDataFromCache.getFromCache(key) as Future<List<Product>>;
    }
  }

  static Future<Product> fetchSingleProduct(int index) async {
    String key = "fetchSingleProduct$index";
    Object? cacheStoreage = FetchDataFromCache.getFromCache(key);

    if (cacheStoreage == null) {
      Future<Product> finalResult =
          FetchDataFromInternet.fetchSingleProduct(index);
      FetchDataFromCache.storeInCache(key, finalResult);
      return finalResult;
    } else {
      return FetchDataFromCache.getFromCache(key) as Future<Product>;
    }
  }

  static Future<List<Category>> fetchCategories() async {
    String key = "fetchCategories";
    Object? cacheStoreage = FetchDataFromCache.getFromCache(key);

    if (cacheStoreage == null) {
      Future<List<Category>> finalResult =
          FetchDataFromInternet.fetchCategories();
      FetchDataFromCache.storeInCache(key, finalResult);
      return finalResult;
    } else {
      return FetchDataFromCache.getFromCache(key) as Future<List<Category>>;
    }
  }

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    String key = "fetchProductsByCategory$category";
    Object? cacheStoreage = FetchDataFromCache.getFromCache(key);

    if (cacheStoreage == null) {
      Future<List<Product>> finalResult =
          FetchDataFromInternet.fetchProductsByCategory(category);
      FetchDataFromCache.storeInCache(key, finalResult);
      return finalResult;
    } else {
      return FetchDataFromCache.getFromCache(key) as Future<List<Product>>;
    }
  }

  static Future<Cart> fetchCart() async {
    String key = "fetchCart";
    Object? cacheStoreage = FetchDataFromCache.getFromCache(key);

    if (cacheStoreage == null) {
      Future<Cart> finalResult = FetchDataFromInternet.fetchCart(FetchData.id);
      FetchDataFromCache.storeInCache(key, finalResult);
      return finalResult;
    } else {
      return FetchDataFromCache.getFromCache(key) as Future<Cart>;
    }
  }

  static void refreshCache() {
    FetchDataFromCache.refreshCache();
    fetchAllProducts();
    fetchCategories();
    fetchCart();
  }

  static Future<User> signUp(UserPassword user) async {
    return FetchDataFromInternet.signUp(user);
  }

  static Future<User> login(UserPassword userPassword) async {
    return FetchDataFromInternet.login(userPassword);
  }
}
