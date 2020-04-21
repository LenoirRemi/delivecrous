import 'package:flutter/material.dart';
import 'package:delivecrous/tile_item.dart';
import 'package:delivecrous/shop_cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MaterialApp(
  title: 'DelivecrousApp',
  home: Home(),
));

class Home extends StatelessWidget {
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
          padding: EdgeInsets.all(8.0),
          child: StaggeredGridView.count(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: <Widget>[
              TileItem("abc", "assets/images/any.jpeg"),
              TileItem("abc", "assets/images/any.jpeg"),
              TileItem("abc", "assets/images/any.jpeg"),
              TileItem("abc", "assets/images/any.jpeg"),
              TileItem("abc", "assets/images/any.jpeg"),
            ],
            staggeredTiles: <StaggeredTile>[
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
            ],
          ),
        )
      );
  }
}