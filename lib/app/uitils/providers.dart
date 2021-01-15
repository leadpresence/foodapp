import 'package:flutter_riverpod/all.dart';
import 'package:foodapp/menu_engine.dart';
import 'package:foodapp/ui/view_models.dart/master_view_model.dart';
import 'package:foodapp/ui/view_models.dart/menuVm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

var menuVMProv = ChangeNotifierProvider((_) => MenuVM());
var masterVMProv = ChangeNotifierProvider((_) => MasterVM());
