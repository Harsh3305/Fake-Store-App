import 'dart:ui';

import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/category.dart';
import 'package:fake_store/pages/category_products.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Category> categoryList = [];
  @override
  void initState() {
    super.initState();
    var futureCategoryList = FetchData.fetchCategories();
    futureCategoryList.whenComplete(() {
      setState(() {
        futureCategoryList.then((value) => categoryList.addAll(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (categoryList.isNotEmpty) {
      return Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryProducts(
                              category: categoryList[index].category)));
                },
                child: Container(
                    color: MyTheme.primaryLight,
                    child: Center(
                      child: Text(
                        categoryList[index].category,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    )),
              ),
            );
          },
          itemCount: categoryList.length,
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
