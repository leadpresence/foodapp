import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_riverpod/all.dart';

class Favorites extends StatefulHookWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  getFavs() {
    context.read(favProv).loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(favProv);
    print(provider.favorites);
    return Container(
      color: Colors.amber,
      child: Container(),
    );
  }
}
