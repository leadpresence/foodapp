import 'package:flutter/foundation.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/storage_service.dart';
import 'package:hooks_riverpod/all.dart';

class BasketViewModel extends ChangeNotifier {
  // BasketViewModel([List<FCategory> bsk]) : super(bsk??[]);

  List<FCategory> basket = [];
  StorageService service = StorageService();

  loadData(context) async {
    basket = await service.getFoodBasket();

    notifyListeners();
  }

  // clear(context) async {
  //   await service.resetCacheTimeToNow();
  // }
}
