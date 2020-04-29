import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:delivecrous/models/cart_model.dart';
import 'package:delivecrous/screens/shop_cart.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return new Size.fromHeight(59.0);
  }
  @override
  Widget build(BuildContext context) {
  var cart = Provider.of<CartModel>(context);
  return AppBar(
        title: Text('Delivecrous'),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 34.0,
                ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopCart()),
                  );
                },
              ),
              cart.items.length == 0 ? new Container():
              new Positioned(child: new Stack(
                children: <Widget>[
                  new Icon(
                    Icons.brightness_1,
                    size:  20.0, color: Colors.white),
                  new Positioned(
                    top: 3.0,
                    right: 4.0,
                    child: new Center(
                      child: new Text(
                        cart.items.length.toString(),
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ],
          ),
          ),
        ],
      );
  }
}