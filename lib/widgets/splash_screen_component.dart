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
          children: [
            Image.asset("assets/images/logo.png"),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 30.0)),
            const Text("Fake Store",
                style: TextStyle(color: Colors.white, fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
