import 'package:fake_store/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreenComponent extends StatelessWidget {
  const SplashScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(128, 44, 110, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LoadImageFromNetwork(
              urlOfImage: "https://fakestoreapi.com/icons/logo.png",
              height: -1,
              width: -1,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Text("Fake Store",
                style: TextStyle(color: Colors.white, fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
