
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:hooks_riverpod/all.dart';

class BuildBasketGridUI extends HookWidget {
  final List<FCategory> kfoodlist;
  const BuildBasketGridUI({Key key, this.kfoodlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: kfoodlist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return BasketFoodBox(
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

class BasketFoodBox extends HookWidget {
  final String name, category, price, imgurl, detail;
  final bool isliked, tobasket;
  final int index;

  const BasketFoodBox(
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
  Widget build(BuildContext context) {
    var provider = useProvider(foodListProv);

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
         
              ],
            ),
          )
        ],
      ),
    );
  }
}



