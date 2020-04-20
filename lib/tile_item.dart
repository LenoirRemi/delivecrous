import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  
  const TileItem(this.text);
  
  final String text;

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/any.jpeg"),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                   child: Text(text), 
                  )
                ),
                Checkbox(
                  value: false,
                  onChanged: null
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}