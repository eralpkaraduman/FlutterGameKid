import 'package:flutter/material.dart';

class CartridgeSelectScreen extends StatefulWidget {
  CartridgeSelectScreen({Key key}) : super(key: key);

  @override
  _CartridgeSelectScreenState createState() => _CartridgeSelectScreenState();
}

class _CartridgeSelectScreenState extends State<CartridgeSelectScreen> {
  bool cartridgeInserted = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AnimatedPositioned(
              top: cartridgeInserted ? -20 : 340,
              width: 400,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: InkWell(
                child: Image.asset("assets/images/cartridge-button.png"),
                onTap: () {
                  setState(() => cartridgeInserted = !cartridgeInserted);
                },
                splashColor: Colors.brown.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
