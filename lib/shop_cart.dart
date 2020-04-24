import 'package:flutter/material.dart';
import 'package:delivecrous/final.dart';
import 'package:delivecrous/colors.dart';

class ShopCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Cart"),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientStart, AppColors.gradientMiddle, AppColors.gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: RaisedButton(
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Final())
              );
            },
            child: 
              Text('Passez commande',
              style: TextStyle(
                color: Colors.white,
              )
            )
          ),
        ),
      ),
    );
  }
}