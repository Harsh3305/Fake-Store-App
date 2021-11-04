import 'package:fake_store/pages/cart_page.dart';
import 'package:fake_store/pages/feedback_page.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Icon(
              Icons.face,
              color: Colors.white,
              size: 100,
            ),
          ),
          ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.shopping_basket_sharp),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('My Cart')
                ]),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
          ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.face),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('User Details')
                ]),
            onTap: () {},
          ),
          ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.add_reaction),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('Feedback')
                ]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeedbackPage()));
            },
          ),
          ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.alternate_email),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('Contract Us')
                ]),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
