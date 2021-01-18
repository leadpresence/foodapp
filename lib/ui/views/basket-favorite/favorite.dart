import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:foodapp/ui/views/food_category_list/food_grid.dart';

class Favorites extends StatefulHookWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
 
  fetchData() async {
    context.read(favProv).loadData(context);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(favProv);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, right: 8, left: 8, bottom: 20),
                child:
                     provider.favorites.isEmpty
                        ?
                         Center(
                    child: Column(
                      children: <Widget>[
                        const VMargin(30),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                        'https://media.istockphoto.com/vectors/open-box-icon-vector-id635771440?k=6&m=635771440&s=612x612&w=0&h=IESJM8lpvGjMO_crsjqErVWzdI8sLnlf0dljbkeO7Ig=',
                                        scale: 3))),
                          ),
                        ),
                        const VMargin(20),
                        Text('Empty favorites add some items'),
                      ],
                    ),

                  ):
                    Column(
                  children: [
                    Expanded(
                      child: BuildIFoodGridUI(
                        kfoodlist: provider.favorites ?? [],
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        provider.clear(context);
                      },
                      child: Icon(FluentIcons.delete_24_regular),
                      backgroundColor: Colors.orange,
                    )
                  ],
                )

                )));
  }
}


