import 'package:flutter/material.dart';
import 'package:delivecrous/tile_item.dart';
import 'package:delivecrous/shop_cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MaterialApp(
  title: 'DelivecrousApp',
  home: Home(),
));

class Home extends StatelessWidget {
  static const cats = [
    {"name": "abc", "image": "assets/images/1.jpg", "price": 15.0},
    {"name": "abefc", "image": "assets/images/2.jpg", "price": 15.0},
    {"name": "abaffec", "image": "assets/images/3.jpg", "price": 15.0},
    {"name": "abavc", "image": "assets/images/4.jpg", "price": 15.0},
    {"name": "abgaghc", "image": "assets/images/5.jpg", "price": 15.0},
    {"name": "abhtrc", "image": "assets/images/6.jpg", "price": 15.0},
    {"name": "abrjtjc", "image": "assets/images/7.jpg", "price": 15.0},
    {"name": "aerbc", "image": "assets/images/8.jpg", "price": 15.0},
    {"name": "aaaaaabc", "image": "assets/images/9.jpg", "price": 15.0},
    {"name": "aeabc", "image": "assets/images/10.jpg", "price": 15.0}
  ];

  Color gradientStart = Color(0xFFFFFFFF);
  Color gradientMiddle = Color(0xFF6DD5FA);
  Color gradientEnd = Color(0xFF2980B9);

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientMiddle, gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp
          )
        ),
        // padding: EdgeInsets.all(8.0),
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: StaggeredGridView.countBuilder(
          itemCount: 10,
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => TileItem(cats[index]["name"], cats[index]["image"], cats[index]["price"]),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        ),
      )
    );
  }
}