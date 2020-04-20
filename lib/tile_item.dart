import 'package:flutter/material.dart';

class TileItem extends StatefulWidget {
  const TileItem(this.text, this.imagepath);
  
  final String text;
  final String imagepath;

  @override
  _TileItemState createState() => new _TileItemState();
}
  
class _TileItemState extends State<TileItem> {
  
  bool _isChecked = false;

  void _valueChanged(bool value) => setState(() => _isChecked = value);

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(widget.imagepath),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                   child: Text(widget.text), 
                  )
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: _valueChanged
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}