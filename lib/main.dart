import 'package:first_demo/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String usernameErr = "Tài khoản không hợp lệ";
  String passwordErr = "Mật khẩu không hợp lệ";
  bool userInvalid = false;
  bool passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.bottomLeft,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const FlutterLogo(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                'Hello\nWellcome back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                controller: _userController,
                decoration: InputDecoration(
                    errorText: userInvalid ? usernameErr : null,
                    labelText: "USERNAME",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                    )),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          errorText: passInvalid ? passwordErr : null,
                          labelText: "PASSWORD",
                          labelStyle: const TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    GestureDetector(
                      onTap: toggleDisplayPass,
                      child: Text(
                        _showPass ? 'HIDE' : 'SHOW',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: onSigninClick,
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleDisplayPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSigninClick() {
    setState(() {
      if (_userController.text.length < 6 ||
          _userController.text.contains('@')) {
        userInvalid = true;
      } else {
        userInvalid = false;
      }

      if (_passController.text.length < 6) {
        passInvalid = true;
      } else {
        passInvalid = false;
      }

      if (!userInvalid && !passInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    });
  }
}
