import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/home.dart';
import 'package:fake_store/pages/login_page.dart';
import 'package:fake_store/pages/sign_up_page.dart';
import 'package:fake_store/pages/splash_screen.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:fake_store/widgets/splash_screen_component.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FetchData.refreshCache();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fake Store",
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      color: MyTheme.primaryLight,
      home: const SplashScreen(
        duration: 3,
        nextScreen: LoginPage(),
        splashScreen: SplashScreenComponent(),
      ),
    );
  }
}
