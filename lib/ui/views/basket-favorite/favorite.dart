import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:foodapp/app/models/category.dart';


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
                      child:GridView.builder(
                            itemCount: provider.favorites.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                            itemBuilder: (BuildContext context, int index) {
                              return FavFoodBox(
                                name: provider.favorites[index].name,
                                imgurl: provider.favorites[index].imgurl,
                                price: provider.favorites[index].price,
                                isliked: provider.favorites[index].isliked,
                                category: provider.favorites[index].category,
                              );
      },
    )
                    ),
            
                  ],
                )

                )));
  }
}



class BuildFavIFoodGridUI extends HookWidget {
  final List<FCategory> kfoodlist;
  const BuildFavIFoodGridUI({Key key, this.kfoodlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: kfoodlist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return FavFoodBox(
          name: kfoodlist[index].name,
          imgurl: kfoodlist[index].imgurl,
          price: kfoodlist[index].price,
          isliked: kfoodlist[index].isliked,
          category: kfoodlist[index].category,
        );
      },
    );
  }
}

class FavFoodBox extends ConsumerWidget {
  final String name, category, price, imgurl, detail;
  final bool isliked, tobasket;
  final int index;

  const FavFoodBox(
      {Key key,
      this.index,
      this.name,
      this.category,
      this.detail,
      this.imgurl,
      this.isliked,
      this.tobasket,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var provider = watch(favProv);

    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 0.5, color: Colors.orange)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 155,
              // width: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(imgurl ??
                        'https://image.freepik.com/free-vector/seamless-pizza-ingredients_1176-269.jpg')),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            Container(
              height: 18,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                name ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ]),
          SizedBox(
            height: 3,
          ),
          Container(
            color: Colors.white60,
            height: 30,
            // width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text("\$${price ?? '0'}"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                SizedBox(),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 8, top: 0, bottom: 8),
                  child: InkWell(
                  splashColor: Colors.orange.shade200,

                    child: Icon(
                      FluentIcons.delete_16_regular,
                      size: 23,
                    ),
                    onTap: () {
                      provider.removeFromFavorite(
                        FCategory(
                        name: name,
                        price: price,
                        imgurl: imgurl,
                        isliked: isliked,
                        category: category,
                        details: detail,
                      ));
                    print(" removed");
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



