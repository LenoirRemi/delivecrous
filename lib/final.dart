import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commande envoyée"),
      ),
      body: SingleChildScrollView(
        child: Container(
        margin: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text("Votre commande a bien été enregistrée.",
                style: TextStyle(
                  height: 2,
                  fontSize: 20,
                ),
              ),
              Image.asset(
                'assets/images/delivery1.gif',
                height: 345,
              ),
              Text("Nos livreurs s'occupent du reste !",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20,
                ),
              ),
              Image.asset(
                'assets/images/delivery2.gif',
                width: 200,
                height: 160,
              ),
            ],
          )
        ),
      )
    );
  }
}
