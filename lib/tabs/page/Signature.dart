import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  SignaturePage({Key? key}) : super(key: key);

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  SignatureController _signatureController = SignatureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("签名"),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: 300.0,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(10),
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.delete_forever_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
