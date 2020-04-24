import 'package:flutter/material.dart';
import 'package:delivecrous/shop_cart.dart';
import 'package:delivecrous/colors.dart';

class Details extends StatefulWidget {
  const Details(this.text, this.imagepath, this.price, this.description);
  
  final String text;
  final String imagepath;
  final double price;
  final String description;

  @override
  _DetailsState createState() => new _DetailsState();
}
  
class _DetailsState extends State<Details> {
  
  bool _isChecked = false;
  void _valueChanged(bool value) => setState(() => _isChecked = value);

  bool _priceColor = true;
  ScrollController _scrollController;

  _scrollListener(){
    setState(() {
      _priceColor = (_scrollController.position.pixels < (MediaQuery.of(context).size.height / 4)) ? true : false;
    });
  }

  @override
  void initState(){
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivecrous'),
        actions: <Widget>[
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
          )],
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientMiddle, AppColors.gradientEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp
            )
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      child: Image(
                        image: AssetImage(widget.imagepath),
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth
                      ),
                    ),
                  )
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.text,
                        //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3)
                        style: TextStyle(
                          fontSize: 40.0,
                        )
                      ),
                    ),
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Checkbox(
                        value: _isChecked, 
                        onChanged: _valueChanged
                      )
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: AnimatedDefaultTextStyle(
                    child: Text(widget.price.toStringAsFixed(2) + " €"),
                    style: _priceColor ? TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                    ): TextStyle(
                      color: Colors.black,
                      fontSize: 25.0
                    ), 
                    duration: Duration(milliseconds: 500)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.description,
                    style: TextStyle(
                      fontSize: 20.0,
                    )
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}