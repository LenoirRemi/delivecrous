import 'package:flutter/material.dart';
import 'package:delivecrous/final.dart';

class ShopCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Cart"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blueGrey,
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Final())
            );
          },
          child: 
            Text('Passez commande',
            style: TextStyle(
              color: Colors.white,
            )
            ),
        ),
      ),
    );
  }
}