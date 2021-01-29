import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodapp/app/models/category.dart';
import 'dart:convert';

class StorageService extends ChangeNotifier {
  static const sharePrefFavoritesKey = 'favoritesKey';
  static const sharedPrefBasketKey = 'basketKey';
  static const sharedPrefLastCacheTimeKey = 'cache_time_key';

//SAVE TO LOCAL SP
  Future<void> _saveToPreferences(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      notifyListeners();
    } catch (e) {
      print("An error ocuured");
    }
  }

//Retrieve from local SP
  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getString(key) ?? '');
  }

  Future<List<FCategory>> getFavoriteFood() async {
    String data = await _getStringFromPreferences(sharePrefFavoritesKey);
    if (data == '') {
      return [];
    }

    List<FCategory> favoriteFoods = _deserializeFoods(data);
    return favoriteFoods;
  }

//convert data back to readable format for the view

  List<FCategory> _deserializeFoods(String data) {
    Iterable l = jsonDecode(data);
    List<FCategory> foods =
        List<FCategory>.from(l.map((model) => FCategory.fromJson(model)));
    return foods;
  }

//favorites
  Future<void> saveFavoriteFood(List<FCategory> foodData) {
    String jsonString = _serializeFoods(foodData);
    return _saveToPreferences(sharePrefFavoritesKey, jsonString);
  }

  //remove and update
  Future<void> replaceFavoriteFood(List<FCategory> f) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove(sharePrefFavoritesKey);

     prefs.setString(sharePrefFavoritesKey, _serializeFoods(f));

  }

  String _serializeFoods(List<FCategory> data) {
    final myfoods = data.map((foodElement) => foodElement).toList();
    return jsonEncode(myfoods);
  }

  //basket

  Future<void> saveFoodToBasket(List<FCategory> foodData) {
    String jsonString = _serializeFoods(foodData);

    return _saveToPreferences(sharedPrefBasketKey, jsonString);
  }

  Future<List<FCategory>> getFoodBasket() async {
    String data = await _getStringFromPreferences(sharedPrefBasketKey);
    if (data == '') {
      return [];
    }
    List<FCategory> foods = _deserializeFoods(data);
    return foods;
  }

  Future<void> resetCacheTimeToNow() async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(sharedPrefLastCacheTimeKey, timestamp);

    prefs.clear();
  }
}
