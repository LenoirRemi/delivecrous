import 'package:delivecrous/models/catalog_model.dart';
import 'package:flutter/widgets.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

/// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items.
  // int get totalPrice =>
  //     items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeAt(int index) {
    _itemIds.removeAt(index);
    notifyListeners();
  }

  double get totalPrice => items.fold(0, (total, current) => total + current.price);
}