import 'package:fake_store/widgets/list_view_of_product.dart';
import 'package:fake_store/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(padding: EdgeInsets.only(top: 5)),
            SearchBar(),
            ListViewOfProducts()
          ],
        ),
      ),
    );
  }
}
