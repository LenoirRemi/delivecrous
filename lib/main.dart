import 'package:flutter/material.dart';
import 'package:delivecrous/models/catalog_model.dart';
import 'package:delivecrous/models/cart_model.dart';
import 'package:delivecrous/screens/shop_cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:delivecrous/common/colors.dart';
import 'package:delivecrous/screens/tile_item.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Home());
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
    child: MaterialApp(
      title: 'APp title',
      initialRoute: '/',
      routes: {
          '/': (context) => MyListItem(),
          '/myCart': (context) => ShopCart(),
        },
      ),
    );
  }
}