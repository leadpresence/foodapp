import 'package:flutter/foundation.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/storage_service.dart';

class FavoritesVM extends ChangeNotifier {
  List<FCategory> favorites = [];
  StorageService service = StorageService();

  loadData(context) async {
    favorites = await service.getFavoriteFood();
    print("xxxxxx");
    print(favorites);
    notifyListeners();
  }

//remove from fav'

  void removeFromFavorite(FCategory food) {
    favorites.remove(food);
    service.replaceFavoriteFood(favorites);
    notifyListeners();
  }

  clear(context) async {
    await service.resetCacheTimeToNow();
  }
}
