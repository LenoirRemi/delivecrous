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
           //child: GridView.count(
           //  crossAxisCount: 2,
           //  childAspectRatio: 0.75,
           //  children: <Widget>[
           //    // card 1 
           //    Card(
           //      elevation: 5.0,
           //      child: Column(
           //        children: <Widget>[
           //          Image(
           //            image: AssetImage("assets/images/any.jpeg"),
           //            alignment: Alignment.topCenter,
           //            fit: BoxFit.fitWidth
           //          ),
           //          Center(
           //            child: Row(
           //            children: <Widget>[
           //              Expanded(
           //                child: Center(
           //                 child: Text("LOREM ..."), 
           //                )
           //              ),
           //              Checkbox(
           //                value: false,
           //                onChanged: null
           //              )
           //          ],
           //          ),
           //          )
           //        ]
           //      ),
           //    ),
           //  ],
           //)

          child: StaggeredGridView.count(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: <Widget>[
              TileItem("abc"),
              TileItem("abc"),
              TileItem("abc"),
              TileItem("abc"),
              TileItem("abc"),
            ],
            staggeredTiles: <StaggeredTile>[
              // StaggeredTile.count(1, 2),
              // StaggeredTile.count(1, 2),
              // StaggeredTile.count(1, 2),
              // StaggeredTile.count(1, 2),
              // StaggeredTile.count(1, 2),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
              StaggeredTile.fit(1),
            ],
          ),

          // child: CustomScrollView(
          //   primary: false,
          //   slivers: <Widget>[
          //     SliverStaggeredGrid.count(
          //       crossAxisCount: 2,
          //       mainAxisSpacing: 4.0,
          //       crossAxisSpacing: 4.0,
          //       children: <Widget>[
          //         TileItem("abc"),
          //         TileItem("abc"),
          //         TileItem("abc"),
          //         TileItem("abc"),
          //         TileItem("abc"),
          //       ],
          //       staggeredTiles: <StaggeredTile>[
          //         StaggeredTile.count(1, 2),
          //         StaggeredTile.count(1, 2),
          //         StaggeredTile.count(1, 2),
          //         StaggeredTile.count(1, 2),
          //         StaggeredTile.count(1, 2),
          //       ],
          //     )
          //   ],
          // ),

        )
      )
    );
  }
}