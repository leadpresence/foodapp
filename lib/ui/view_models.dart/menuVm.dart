import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/ui/views/basket_view.dart';
import 'package:foodapp/ui/views/favorite.dart';
import 'package:foodapp/ui/views/master_view.dart';
// pages

class MenuVM extends ChangeNotifier {
  var _index = 0;
  get index => _index;

  set index(val) {
    _index = val;
    notifyListeners();
  }

  List<Widget> pagesTabs = [
    Master(), 
    Favorites(),
    BasketView()];
}
