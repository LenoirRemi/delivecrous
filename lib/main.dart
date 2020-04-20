import 'package:flutter/material.dart';
import 'package:delivecrous/tile_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Delivecrous',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delivecrous')
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
      )
    );
  }
}