import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 180, 254, 1.0),
      // appBar: AppBar(
      //   title: Text("LoginPage"),
      //   backgroundColor: Color.fromRGBO(2, 180, 254, 1.0),
      //   elevation: 0.0,
      // ),
      body: Center(
        child: Container(
          color: Color.fromRGBO(0, 172, 237, 1.0),
          // height: double.infinity,
          // width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                  right: 40.0,
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(2, 180, 254, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Center(
                  child: Text("Logo"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: CupertinoTextField(
                        placeholder: "Username",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: CupertinoTextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        placeholder: "Password",
                        style: TextStyle(),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      buttonPadding: EdgeInsets.only(left: 20, right: 20),
                      children: [
                        ElevatedButton(
                          child: Text("Login In"),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Text("Sign Up"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
