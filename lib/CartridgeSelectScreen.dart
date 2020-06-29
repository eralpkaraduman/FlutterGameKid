import 'package:flutter/material.dart';
import 'package:flutterKid/cartridges/buttonGame/ButtonGameCartridge.dart';
import 'package:flutterKid/system.dart';

class CartridgeSelectScreen extends StatefulWidget {
  CartridgeSelectScreen({Key key}) : super(key: key);

  @override
  _CartridgeSelectScreenState createState() => _CartridgeSelectScreenState();
}

class _CartridgeSelectScreenState extends State<CartridgeSelectScreen> {
  bool _cartridgeInserted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AnimatedPositioned(
              top: !_cartridgeInserted ? -20 : 335,
              width: 400,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: InkWell(
                child: Image.asset("assets/images/cartridge-button.png"),
                onTap: () {
                  if (_cartridgeInserted) {
                    setState(() => _cartridgeInserted = false);
                    System().loadCartridge(null);
                  } else {
                    setState(() => _cartridgeInserted = true);
                    System().loadCartridge(ButtonGameCartridge());
                  }
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
