import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/list_view_of_product.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState(category);
}

class _CategoryProductsState extends State<CategoryProducts> {
  final String category;
  List<Product> listOfProduct = [];
  _CategoryProductsState(this.category);
  @override
  void initState() {
    super.initState();

    var futureList = FetchData.fetchProductsByCategory(category);
    futureList.whenComplete(() {
      setState(() {
        futureList.then((value) => listOfProduct.addAll(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        title: Text(category),
        centerTitle: true,
      ),
      body: Center(child: ListViewOfProducts(productList: listOfProduct)),
    ));
  }
}
