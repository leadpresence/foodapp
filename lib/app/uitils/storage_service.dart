import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodapp/app/models/category.dart';
import 'dart:convert';

class StorageService extends ChangeNotifier {
  static const sharePrefFavoritesKey = 'favoritesKey';
  static const sharedPrefBasketKey = 'basketKey';

//SAVE TO LOCAL SP
  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

//Retrieve from local SP
  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

  Future<List<FCategory>> getFavoriteFood() async {
    String data = await _getStringFromPreferences(sharePrefFavoritesKey);
    if (data == '') {
      return [];
    }

    return _deserializeFoods(data);
  }

  List<FCategory> _deserializeFoods(String data) {
    final foodList = jsonDecode(data);
    List<FCategory> list = [];
    for (String food in foodList) {
      list.add(FCategory(name: food));
    }
    return list;
  }

//favorites
  Future<void> saveFavoriteFood(List<FCategory> foodData) {
    String jsonString = _serializeFoods(foodData);
    return _saveToPreferences(sharePrefFavoritesKey, jsonString);
  }

  String _serializeFoods(List<FCategory> data) {
    final myfoods = data.map((foodElement) => foodElement.name).toList();
    return jsonEncode(myfoods);
  }

  //basket

  Future<void> saveFoodToBasket(List<FCategory> foodData) {
    print(foodData);
    String jsonString = _serializeFoods(foodData);
    return _saveToPreferences(sharePrefFavoritesKey, jsonString);
    // _notifyListeners();
  }

  Future<List<FCategory>> getFoodFoodBasket() async {
    String data = await _getStringFromPreferences(sharedPrefBasketKey);
    print(data);
    if (data == '') {
      return [];
    }
    List<FCategory> foods = _deserializeFoods(data);
    print(foods);
    return foods;
  }
  
}
