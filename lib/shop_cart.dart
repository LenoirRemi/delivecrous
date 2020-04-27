import 'package:flutter/material.dart';
import 'package:delivecrous/final.dart';
import 'package:delivecrous/colors.dart';
import 'package:delivecrous/cats.dart';

class ShopCart extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Shop Cart"),
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
          margin: const EdgeInsets.all(10.0),
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
              Container(
                height: 250,
                  child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Center(child: Text(AppCats.cats[index]["name"])),
                      );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
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
                child: Center(
                  child: RaisedButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Final())
                      );
                    },
                    child: 
                      Text('Passez commande',
                      style: TextStyle(
                        color: Colors.white,
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