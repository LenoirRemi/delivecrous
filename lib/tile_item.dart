import 'package:flutter/material.dart';
import 'package:delivecrous/details.dart';

class TileItem extends StatefulWidget {
  const TileItem(this.text, this.imagepath, this.price, this.description);
  
  final String text;
  final String imagepath;
  final double price;
  final String description;

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        children: <Widget>[
            InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0), 
                  topRight: Radius.circular(8.0)
                ),
                child: Image(
                  image: AssetImage(widget.imagepath),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(widget.text, widget.imagepath, widget.price, widget.description)),
                );
              },
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                   child: Text(
                    widget.text,
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3)
                   ), 
                  )
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: _valueChanged
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.0, bottom: 6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.price.toStringAsFixed(2) + " €",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)
              ),
            ),
          ),
        ],
      ),
    );
  }
}