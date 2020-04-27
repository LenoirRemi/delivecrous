import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'tile_item.dart';

class CartModel extends ChangeNotifier {
  final List<TileItem> _items = [];

  UnmodifiableListView<TileItem> get items => UnmodifiableListView(_items);

  void add(TileItem item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}