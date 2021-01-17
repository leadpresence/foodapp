import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodapp/app/uitils/storage_service.dart';

class FoodListViewModel extends ChangeNotifier {
  //temporary list of favorited foods

  StorageService service= StorageService();

  List<FCategory> _favoriteFoods = [];
  List<FCategory> _foodBasktet = [];
  Color _basketColor;
  Color get basketColor => _basketColor;

  bool _isliked;
  bool get isliked => _isliked;

  set isliked(bool val) {
    _isliked = val;
    notifyListeners();
  }


  void addToBasket(FCategory food) {
    _foodBasktet.add(food);
    service.saveFoodToBasket(_foodBasktet);

  }

  void removeFromBasket(String foodName) {
    for (final food in _foodBasktet) {
      if (food.name == foodName) {
        _foodBasktet.remove(food);
        break;
      }
    }
    service.saveFavoriteFood(_favoriteFoods);
  }

  void addToFavorites(String foodName) {
    _favoriteFoods.add(FCategory(name: foodName));
    service.saveFavoriteFood(_favoriteFoods);
  }

//remove from fav

  void removeFromFavorite(String foodName) {
    for (final food in _favoriteFoods) {
      if (food.name == foodName) {
        _favoriteFoods.remove(food);
        break;
      }
    }
    service.saveFavoriteFood(_favoriteFoods);
  }

  void toggleFavoriteStatus(int choiceIndex) {
    final isFavorite = !_favoriteFoods[choiceIndex].isliked;
    final name = _favoriteFoods[choiceIndex].name;

    // update display
    _favoriteFoods[choiceIndex].isliked = isFavorite;

    // update favorite list
    if (isFavorite) {
      addToFavorites(name);
    } else {
      removeFromFavorite(name);
    }

    notifyListeners();
  }
}
