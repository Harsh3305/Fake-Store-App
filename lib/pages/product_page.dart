import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/load_image.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final int id = product.id;
    final String title = product.title;
    final double price = product.price;
    final String description = product.description;
    // final String category = product.category;
    final String image = product.image;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              color: MyTheme.primaryLight,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Hero(
                tag: id,
                child: LoadImageFromNetwork(
                    urlOfImage: image, height: 500, width: -1)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontSize: 20)),
            ),
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