import 'package:flutter/material.dart';

class CatalogModel {
  static const _cats = [
    {
        "name":"Grumpy",
        "image":"assets/images/1.jpg",
        "price":15000.0,
        "description": "Tardar Sauce, alias Grumpy Cat, née le 4 avril 2012 à Morristown en Arizona (États-Unis) et morte le 14 mai 2019 dans la même ville, est une chatte célèbre sur internet, devenue un mème Internet en raison de son expression faciale boudeuse. Littéralement, grumpy cat signifie « chat grincheux ». Selon la propriétaire de l'animal, l'expression faciale inhabituelle de Tardar Sauce est due au nanisme du félin et à la malocclusion dentaire dont il est affecté."
    },
    {
        "name":"Lil Bub",
        "image":"assets/images/2.jpg",
        "price":6969.0,
        "description": "Lil Bub, née le 21 juin 2011 et morte le 1er décembre 2019, est une chatte vivant à Bloomington dans l'Indiana aux États-Unis."
    },
    {
        "name":"Hamilton",
        "image":"assets/images/3.jpg",
        "price":22000.0,
        "description": "Hamilton est un chaton adopté par la Humane Society dans la Silicon Valley.  Sa moustache parfaite et ses expressions faciales à caractère humain ont fait de lui une sensation sur Internet et lui ont valu d'être reconnu dans divers programmes et journaux d'information du monde entier."
    },
    {
        "name":"Venus",
        "image":"assets/images/4.jpg",
        "price":1282.0,
        "description": "Vénus, connue sous le nom de Vénus le chat à deux visages (née en 2008 ou 2009) est un chat américain en écaille de tortue dont le visage est moitié noir et moitié roux tigré. De plus, ses yeux sont hétérochromes, son œil gauche étant vert, son œil droit bleu. Ses comptes sur les médias sociaux utilisent le slogan \"0% de photoshopping, 100% né comme ça\"."
    },
    {
        "name":"Nala",
        "image":"assets/images/5.jpg",
        "price":520.0,
        "description": "L'histoire d'un chaton, Nala, commence dans une maison où les propriétaires ne pouvaient plus s'occuper des chats et des chatons parce qu'ils étaient trop nombreux. Nala a alors été emmenée au refuge où elle a été séparée de sa famille d'origine. Malheureusement, nous ne savons pas ce qu'il est advenu des autres chats ou chatons, mais une fois adoptée, Nala était la seule qui restait."
    },
    {
        "name":"Coby",
        "image":"assets/images/6.jpg",
        "price":8420.0,
        "description": "Je suis un petit British Shorthair de quatre ans. Oui, un garçon. (Ne vous laissez pas tromper par l'eye-liner.) J'aime le thon en conserve et les longues promenades sur les comptoirs. Ne parlez pas de cette dernière partie à ma mère, s'il vous plaît."
    },
    {
        "name":"Duma",
        "image":"assets/images/7.jpg",
        "price":320.0,
        "description": "Bonjour ! Je m'appelle Duma. Je suis une femelle Bengal du Michigan."
    },
    {
        "name":"Sam",
        "image":"assets/images/8.jpg",
        "price":1000.0,
        "description": "Pendant une semaine à la mi-mars 2012, deux ou trois choses ont été sensiblement différentes dans notre quartier : il y avait une cage de transport pour chats sans porte devant la maison de nos voisins qui ne possèdent pas de chats, et il y avait un beau chat blanc qui est soudainement apparu que personne n'avait vu auparavant. Ce chat était différent des autres dans notre quartier car il était complètement blanc avec seulement des marques noires sur le front et sur la queue. Il était également différent parce qu'il est resté au même endroit, sans se mêler aux autres chats, pendant environ une semaine. Pendant ce temps, les voisins et ma famille ont essayé de le faire manger ou boire de l'eau, mais il n'a pas bougé d'un pouce. Craignant qu'il ne soit blessé, nous avons décidé de l'accueillir. C'est lors de notre première visite chez le vétérinaire que nous avons appris qu'il avait probablement été abandonné parce qu'il était déjà castré et qu'il n'avait pas de callosités sur ses coussinets. Après quelques semaines, nous avons décidé de l'adopter dans une autre famille et nous avons décidé de l'appeler Sam, d'après les chats d'Andy Warhol. En octobre de cette année-là, nous n'avons pas pu trouver de famille pour Sam et il était devenu si important dans notre foyer que nous avons décidé de le garder."
    },
    {
        "name":"Black Cat",
        "image":"assets/images/9.jpg",
        "price":85.0,
        "description": "Juste un chat noir pour Halloween !"
    },
    {
        "name":"Yuppe",
        "image":"assets/images/10.jpg",
        "price":150.0,
        "description": "Un gros British Longhair roux."
    }
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [_cats].
  Item getById(int id) => Item(id, _cats[id]["name"], _cats[id]["image"], _cats[id]["price"], _cats[id]["description"]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Item {

  final int id;
  final String name;
  final String image;
  final double price;
  final String description;

  Item(this.id, this.name, this.image, this.price, this.description);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}