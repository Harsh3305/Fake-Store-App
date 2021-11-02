import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/product_display.dart';
import 'package:flutter/material.dart';

class ListViewOfProducts extends StatefulWidget {
  const ListViewOfProducts({Key? key, required this.productList})
      : super(key: key);
  final List<Product> productList;
  @override
  State<ListViewOfProducts> createState() =>
      _ListViewOfProductsState(productList);
}

class _ListViewOfProductsState extends State<ListViewOfProducts> {
  final List<Product> productList;
  Widget visibleWidget = const CircularProgressIndicator();

  _ListViewOfProductsState(this.productList);
  // @override
  // void initState() {
  //   super.initState();
  //   var futureList = FetchData.fetchAllProducts();
  //   futureList.whenComplete(() {
  //     setState(() {
  //       futureList.then((value) => productList.addAll(value));
  //     });
  //   });
  // }

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
      });
    } else {
      setState(() {
        visibleWidget = const CircularProgressIndicator();
      });
    }
    return visibleWidget;
  }
}
