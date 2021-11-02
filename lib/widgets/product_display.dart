import 'package:fake_store/widgets/load_image.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image})
      : super(key: key);
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadImageFromNetwork(urlOfImage: image, height: 100, width: -1),
        Text(title),
        Text("$price")
      ],
    );
  }
}
