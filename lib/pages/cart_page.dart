import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/cart.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/list_view_of_product.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:fake_store/widgets/product_display.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> listOfCartProduct = [];
  @override
  void initState() {
    super.initState();
    Future<Cart> futureCartList = FetchData.fetchCart();

    futureCartList.whenComplete(() {
      futureCartList.then((value) {
        value.products.forEach((element) {
          var futureCartProduct = element.convertToProduct();
          futureCartProduct.whenComplete(() {
            setState(() {
              futureCartProduct.then((value) => listOfCartProduct.add(value));
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainBody = CircularProgressIndicator(
      color: MyTheme.primaryLight,
    );
    if (listOfCartProduct.isNotEmpty) {
      mainBody = ListViewOfProducts(
        productList: listOfCartProduct,
        isListView: true,
      );
    }
    int numberOfItems = 0;
    if (listOfCartProduct.isNotEmpty) {
      numberOfItems = listOfCartProduct.length;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        title: Text("My Cart $numberOfItems"),
        centerTitle: true,
      ),
      body: Center(child: mainBody),
    );
  }
}
