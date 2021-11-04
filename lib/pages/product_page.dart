import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/load_image.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _items_add_to_cart = 0;

  @override
  Widget build(BuildContext context) {
    final int id = widget.product.id;
    final String title = widget.product.title;
    final double price = widget.product.price;
    final String description = widget.product.description;
    // final String category = product.category;
    final String image = widget.product.image;
    Widget addToCartText = const Text(
      "Add To Cart",
      style: TextStyle(color: Colors.white),
    );
    if (_items_add_to_cart > 0) {
      addToCartText = Text(
        "Items: $_items_add_to_cart",
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    Widget cart_button = Container(
      color: MyTheme.primaryLight,
      child: TextButton(
          onPressed: () {
            // developer.log("Add to cart, product = $id");
            setState(() {
              _items_add_to_cart = 1;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                "Add To Cart",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );

    if (_items_add_to_cart > 0) {
      cart_button = Container(
        color: MyTheme.primaryLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _items_add_to_cart--;
                });
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            addToCartText,
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _items_add_to_cart++;
                  });
                },
                icon: const Icon(Icons.add, color: Colors.white))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: id,
                child: LoadImageFromNetwork(
                    urlOfImage: image, height: 500, width: -1)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontSize: 20)),
            ),
            cart_button,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text((String.fromCharCodes(Runes('\u0024'))) + "$price",
                  style: const TextStyle(fontSize: 20, color: Colors.red)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
