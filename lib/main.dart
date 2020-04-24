import 'package:flutter/material.dart';
import 'package:delivecrous/tile_item.dart';
import 'package:delivecrous/shop_cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:delivecrous/colors.dart';
import 'package:delivecrous/cats.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientStart, AppColors.gradientMiddle, AppColors.gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp
          )
        ),
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(8.0),
          itemCount: 10,
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => TileItem(
            AppCats.cats[index]["name"],
            AppCats.cats[index]["image"],
            AppCats.cats[index]["price"],
            AppCats.cats[index]["description"]
          ),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        ),
      )
    );
  }
}