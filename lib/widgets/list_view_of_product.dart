import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/product_display.dart';
import 'package:flutter/material.dart';

class ListViewOfProducts extends StatefulWidget {
  const ListViewOfProducts(
      {Key? key, required this.productList, required this.isListView})
      : super(key: key);
  final List<Product> productList;
  final bool isListView;
  @override
  State<ListViewOfProducts> createState() => _ListViewOfProductsState(
      productList: productList, isListView: isListView);
}

class _ListViewOfProductsState extends State<ListViewOfProducts> {
  final List<Product> productList;
  final isListView;
  Widget visibleWidget = const CircularProgressIndicator();

  _ListViewOfProductsState(
      {required this.productList, required this.isListView});

  @override
  Widget build(BuildContext context) {
    if (productList.isNotEmpty) {
      setState(() {
        visibleWidget = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductDisplay(
              product: productList[index],
            );
          },
          itemCount: productList.length,
        );

        if (isListView) {
          visibleWidget = ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductDisplay(
                  product: productList[index],
                ),
              );
            },
            itemCount: productList.length,
          );
        }
      });
    } else {
      setState(() {
        visibleWidget = const CircularProgressIndicator();
      });
    }
    return visibleWidget;
  }
}
