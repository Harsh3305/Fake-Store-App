import 'package:fake_store/models/product.dart';
import 'package:fake_store/pages/product_page.dart';
import 'package:fake_store/widgets/load_image.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final int id = widget.product.id;
    final String title = widget.product.title;
    final double price = widget.product.price;
    final String image = widget.product.image;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(product: widget.product)));
      },
      child: Container(
        // color: _backgroundColor,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.75))
        ], color: _backgroundColor),
        child: Column(
          children: [
            Hero(
                tag: id,
                child: LoadImageFromNetwork(
                    urlOfImage: image, height: 100, width: -1)),
            Text(title),
            Text((String.fromCharCodes(Runes('\u0024'))) + "$price")
          ],
        ),
      ),
    );
  }
}
