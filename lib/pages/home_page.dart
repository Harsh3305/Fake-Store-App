import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/list_view_of_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> productList = [];
  @override
  void initState() {
    super.initState();
    var futureList = FetchData.fetchAllProducts();
    futureList.whenComplete(() {
      setState(() {
        futureList.then((value) => productList.addAll(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListViewOfProducts(productList: productList, isListView: false));
  }
}
