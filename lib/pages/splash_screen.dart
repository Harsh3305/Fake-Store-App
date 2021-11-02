import 'dart:async';

import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {Key? key,
      required this.splashScreen,
      required this.nextScreen,
      required this.duration})
      : super(key: key);
  final Widget splashScreen;
  final Widget nextScreen;
  final int duration;

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(splashScreen, nextScreen, duration);
}

class _SplashScreenState extends State<SplashScreen> {
  final Widget splashScreen;
  final Widget nextScreen;
  final int duration;
  late Widget currentScreen;
  _SplashScreenState(this.splashScreen, this.nextScreen, this.duration);

  @override
  void initState() {
    super.initState();
    setState(() {
      currentScreen = splashScreen;
    });
    Timer(const Duration(seconds: 10), () {
      setState(() {
        currentScreen = nextScreen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentScreen;
  }
}
