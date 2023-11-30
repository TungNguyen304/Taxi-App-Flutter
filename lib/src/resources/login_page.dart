import 'package:first_demo/src/blocs/login_bloc.dart';
import 'package:first_demo/src/resources/home_page.dart';
import 'package:flutter/material.dart';

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

  LoginBloc bloc = LoginBloc();
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
                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        labelText: "USERNAME",
                        labelStyle: const TextStyle(
                          fontSize: 15,
                        )),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    StreamBuilder(
                      stream: bloc.passStream, 
                      builder: (context, snapshot) => TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          labelText: "PASSWORD",
                          labelStyle: const TextStyle(
                            fontSize: 15,
                          )),
                    ),
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
    if(bloc.isValidInfo(_userController.text, _passController.text)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
