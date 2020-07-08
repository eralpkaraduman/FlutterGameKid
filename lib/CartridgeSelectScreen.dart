import 'package:flutter/material.dart';
import 'package:flutterKid/cartridges/buttonGame/ButtonGameCartridge.dart';
import 'package:flutterKid/system.dart';
import 'system.dart';

class CartridgeSelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            StreamBuilder<bool>(
              stream: System().cartridgeInsertedStream,
              initialData: false,
              builder: (_, snap) {
                final bool _cartridgeInserted = snap.data;
                return AnimatedPositioned(
                  top: !_cartridgeInserted ? -65 : 278,
                  width: 400,
                  duration: Duration(milliseconds: 500),
                  curve: _cartridgeInserted
                      ? Curves.easeInCirc
                      : Curves.easeInOutBack,
                  child: InkWell(
                    child: Image.asset("assets/images/cartridge-button.png"),
                    onTap: () {
                      if (_cartridgeInserted) {
                        System().loadCartridge(null);
                      } else {
                        System().loadCartridge(ButtonGameCartridge());
                      }
                    },
                    splashColor: Colors.brown.withOpacity(0.5),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
