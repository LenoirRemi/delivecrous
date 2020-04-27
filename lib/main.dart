import 'package:flutter/material.dart';
import 'package:delivecrous/models/catalog_model.dart';
import 'package:delivecrous/models/cart_model.dart';
import 'package:delivecrous/screens/shop_cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:delivecrous/common/colors.dart';
import 'package:delivecrous/screens/tile_item.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(MaterialApp(
    title: 'DelivecrousApp',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: 
    [
      // In this sample app, CatalogModel never changes, so a simple Provider
      // is sufficient.
      Provider(create: (context) => CatalogModel()),
      // CartModel is implemented as a ChangeNotifier, which calls for the use
      // of ChangeNotifierProvider. Moreover, CartModel depends
      // on CatalogModel, so a ProxyProvider is needed.
      ChangeNotifierProxyProvider<CatalogModel, CartModel>(
        
        create: (context) => CartModel(),
        update: (context, catalog, cart) {
          cart.catalog = catalog;
          return cart;
        },
      ),
    ],
    child: Scaffold(
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
          itemBuilder: (context, index) => TileListItem(index),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        ),
      )
     ),
    );
  }
}