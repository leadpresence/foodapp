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
  }

  removeFav(FCategory f)async {
    if (favorites.contains(f)) favorites.remove(f);
    favorites = await service.getFavoriteFood();

  }

  clear(context) async {
    await service.resetCacheTimeToNow();
  }
}
