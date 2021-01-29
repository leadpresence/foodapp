import 'package:flutter_riverpod/all.dart';
import 'package:foodapp/app/uitils/storage_service.dart';
import 'package:foodapp/ui/view_models.dart/basket_view_model..dart';
import 'package:foodapp/ui/view_models.dart/favorites_vm.dart';
import 'package:foodapp/ui/view_models.dart/food_category_list_vm.dart';
import 'package:foodapp/ui/view_models.dart/master_view_model.dart';
import 'package:foodapp/ui/view_models.dart/menuVm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Providers

var menuVMProv = ChangeNotifierProvider((_) => MenuVM());
var masterVMProv = ChangeNotifierProvider((_) => MasterVM());
var storageProv = ChangeNotifierProvider((_) => StorageService());
var foodListProv = ChangeNotifierProvider((_) => FoodListViewModel());
var favProv = ChangeNotifierProvider((_) => FavoritesVM());
var baskProv = ChangeNotifierProvider((_) => BasketViewModel());



// final habitsProvider = StateNotifierProvider(
//   (ref) => HabitListStateNotifier(
//     [
//       Habit(title: 'Example Habit'),
//     ],
//   ),
// );