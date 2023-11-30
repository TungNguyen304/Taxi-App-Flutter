import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      labelStyle: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    Text(
                      'SHOW',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                       shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                    onPressed: onPressed,
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {

  }
}
