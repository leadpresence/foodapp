import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/storage_service.dart';
import 'package:hooks_riverpod/all.dart';

class FavoritesNotifier extends    StateNotifier<List<FCategory>> {
  FavoritesNotifier(state) : super(state ?? []);

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
