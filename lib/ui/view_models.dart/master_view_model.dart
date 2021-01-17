import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/models/food.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class MasterVM extends ChangeNotifier {
  TextEditingController filter;

  List<FCategory> foodFeeds = [];
  Food f;
  String _searchText;
  String get searchText => _searchText;

  Icon _searchIcon = Icon(FluentIcons.search_24_regular);
  Icon get searchIcon => _searchIcon;

  Widget _appBarTitle;
  Widget get appBarTitle => _appBarTitle;

  set searchIcon(Icon val) {
    _searchIcon = val;
    notifyListeners();
  }

  set appBarTitle(Widget val) {
    _appBarTitle = val;
    notifyListeners();
  }

  set searchText(String val) {
    _searchText = val;
    notifyListeners();
  }

//FAKE LOCAL API
  fetchFoodCategories(context) async {
    final myFoods = await rootBundle.loadString('assets/data.json');
    //DECODE JSON IN TO A LIST OF TYLES FOODS CAT.
    foodFeeds = FCategoryList.fromJson(myFoods).categories.toList();
  }
}
