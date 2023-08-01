import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwdFocusNode = FocusNode();
  //FocusScopeNode focusScopeNode = FocusScopeNode();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();
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
                  top: 70.0,
                  left: 70.0,
                  right: 70.0,
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
                  left: 70.0,
                  right: 70.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Form(
                  key: widget.key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          controller: emailTextController,
                          focusNode: emailFocusNode,
                          //键盘显示聚焦到下一个输入框,即下一项
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            // bool res = FocusScope.of(context).nextFocus();
                            // print(res);
                            FocusScope.of(context).requestFocus(pwdFocusNode);
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            //顶部文本在输入内容时显示
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding: EdgeInsets.all(12.0),
                            //未聚焦时下划线的颜色
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(2, 180, 254, 1.0),
                              ),
                            ),
                            //聚焦时下划线的颜色
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontFamily: "SAO",
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            //TODO 查询数据库是否存在该用户
                            if (value!.length < 5) {
                              return "curret";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: TextFormField(
                          focusNode: pwdFocusNode,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: "Password",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding: EdgeInsets.all(12.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(2, 180, 254, 1.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontFamily: "SAO",
                            ),
                          ),
                          //密文
                          obscureText: true,
                          //enableSuggestions: true,
                          validator: (value) {
                            //TODO 匹配pwd
                          },
                          onChanged: (vlaue) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding: EdgeInsets.only(left: 30, right: 30),
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(2, 180, 254, 1.0)),
                    ),
                    child: Text("Sign Up"),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(2, 180, 254, 1.0)),
                    ),
                    child: Text("Login In"),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
