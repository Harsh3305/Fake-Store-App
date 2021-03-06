import 'package:fake_store/dao/fetch_data.dart';
import 'package:fake_store/models/user/user.dart';
import 'package:fake_store/models/user_password.dart';
import 'package:fake_store/pages/sign_up_page.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  bool isError = false;
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 0.45,
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              if (isError)
                const Text(
                  "Please check your Email ID and Password",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (email) {
                  setState(() {
                    _email = email;
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (password) {
                  setState(() {
                    _password = password;
                  });
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Forget password?',
                      style: TextStyle(fontSize: 12.0, color: Colors.indigo),
                    ),
                    if (_isloading) const CircularProgressIndicator(),
                    ElevatedButton(
                      child: const Text('Login'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.primaryLight)),
                      onPressed: () {
                        setState(() {
                          _isloading = true;
                        });
                        UserPassword userPassword =
                            UserPassword(_email, _password);
                        Future<User> futureUser = FetchData.login(userPassword);
                        setState(() {
                          isError = false;
                        });
                        futureUser.whenComplete(() => futureUser.then((value) {
                              setState(() {
                                _isloading = false;
                              });
                              if (value.id == "-1") {
                                setState(() {
                                  isError = true;
                                });
                              } else {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              }
                            }));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text.rich(
                    TextSpan(text: 'Don\'t have an account ', children: [
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(color: MyTheme.primaryLight),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
