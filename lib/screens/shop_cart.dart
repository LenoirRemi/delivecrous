import 'package:flutter/material.dart';
import 'package:delivecrous/screens/final.dart';
import 'package:delivecrous/models/cart_model.dart';
import 'package:delivecrous/common/colors.dart';
import 'package:provider/provider.dart';

class ShopCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Delivecrous"),
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
        child: Container(
          margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Panier",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _CartList(),
                ),
                Container(
                  child: Row(
                    children: [
                      Text("Où veut-tu te faire livrer ?\nEn salle de TD?",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Adresse",  
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.7),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15.7),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "CP",
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.7),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15.7),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Ville",
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.7),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15.7),
                          ),
                        ),
                      ), 
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: RaisedButton(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      //color: Colors.blueGrey,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Final())
                        );
                      },
                      child: 
                        Text('Passer commande',
                        style: TextStyle(
                          color: Colors.black,
                          )
                        )
                      ),
                    ),
                  ),
              ],
            ),
            ),
          ),
      );
    }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      var cart = Provider.of<CartModel>(context);

      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: cart.items.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(cart.items[index].image),
                alignment: Alignment.centerRight,
                height: 60,
                fit: BoxFit.scaleDown
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    cart.items[index].name,
                  ),
                )
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.black,
                  size: 30.0,
                ), onPressed: () {
                  cart.removeAt(index);
                },
              )
            ],
          ),
        )
      );
  }
}