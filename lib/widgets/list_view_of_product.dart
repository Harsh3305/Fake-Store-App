import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/product.dart';
import 'package:fake_store/widgets/product_display.dart';
import 'package:flutter/material.dart';

class ListViewOfProducts extends StatefulWidget {
  const ListViewOfProducts({Key? key}) : super(key: key);

  @override
  State<ListViewOfProducts> createState() => _ListViewOfProductsState();
}

class _ListViewOfProductsState extends State<ListViewOfProducts> {
  List<Product> productList = [];
  bool isDataLoaded = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      FetchData.fetchAllProducts().then((value) => productList.addAll(value));
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      shrinkWrap: true,
      // scrollDirection: Axis.vertical,

      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: ProductDisplay(
                    id: productList[index].id,
                    title: productList[index].title,
                    price: productList[index].price,
                    description: productList[index].description,
                    category: productList[index].category,
                    image: productList[index].image),
              ),
            ],
          ),
        );
      },
      itemCount: productList.length,
    );
    if (isDataLoaded) {
      return listView;
    } else {
      return const CircularProgressIndicator();
    }
  }
}
