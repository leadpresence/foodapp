import 'package:flutter/foundation.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/storage_service.dart';

class BasketViewModel extends ChangeNotifier {
  List<FCategory> basket = [];
  StorageService service = StorageService();

  loadData(context) async {
    basket = await service.getFoodBasket();
  }

  clear(context) async {
    await service.resetCacheTimeToNow();
  }
}
