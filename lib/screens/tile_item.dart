import 'package:delivecrous/common/colors.dart';
import 'package:delivecrous/models/cart_model.dart';
import 'package:delivecrous/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:delivecrous/screens/details.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
  
class TileListItem extends StatelessWidget {

  final int index;

  TileListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var catalog = Provider.of<CatalogModel>(context);
    var cart = Provider.of<CartModel>(context);
    var item = catalog.getByPosition(index);

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
                  image: AssetImage(item.image),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(index)),
                );
              },
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                   child: Text(
                    item.name,
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3)
                   ), 
                  )
                ),
                Checkbox(
                  value: cart.items.contains(item),
                  onChanged: (bool newValue) {
                    if(newValue){
                      cart.add(item);
                    }else{
                      cart.remove(item);
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.0, bottom: 6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.price.toStringAsFixed(2) + " €",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}