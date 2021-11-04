import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/cart.dart';
import 'package:fake_store/models/cart_product.dart';
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
  List<Product> listOfProduct = [];
  List<CartProduct> listOfCartproduct = [];
  @override
  void initState() {
    super.initState();
    Future<Cart> futureCartList = FetchData.fetchCart();

    futureCartList.whenComplete(() {
      futureCartList.then((value) {
        value.products.forEach((element) {
          setState(() {
            listOfCartproduct.add(element);
          });
          var futureCartProduct = element.convertToProduct();
          futureCartProduct.whenComplete(() {
            setState(() {
              futureCartProduct.then((value) {
                listOfProduct.add(value);
              });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double amount = _calculatePriceOfProducs();
    Widget mainBody = CircularProgressIndicator(
      color: MyTheme.primaryLight,
    );
    if (listOfProduct.isNotEmpty) {
      mainBody = ListViewOfProducts(
        productList: listOfProduct,
        isListView: true,
      );
      if (listOfProduct.isNotEmpty) {
        mainBody = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mainBody,
            Container(
              color: MyTheme.primaryLight,
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.money_rounded, color: Colors.white),
                      Text(
                        "Proceed to Pay " +
                            String.fromCharCodes(Runes('\u0024')) +
                            "$amount",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            )
          ],
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        title: Text(
            "My Cart: " + String.fromCharCodes(Runes('\u0024')) + "$amount"),
        centerTitle: true,
      ),
      body: Center(child: mainBody),
    );
  }

  double _calculatePriceOfProducs() {
    if (listOfCartproduct.isEmpty) {
      return 0.0;
    } else {
      double amount = 0;
      for (int i = 0; i < listOfProduct.length; i++) {
        CartProduct cartproduct = listOfCartproduct[i];
        int quantity = cartproduct.quantity;
        Product currentProduct = listOfProduct[i];
        double priceOfSingleProduct = currentProduct.price;

        amount += priceOfSingleProduct * quantity;
      }

      return amount;
    }
  }
}
