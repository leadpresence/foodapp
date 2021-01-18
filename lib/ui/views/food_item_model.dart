import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/models/category.dart';
import 'dart:ui';
import 'package:foodapp/app/uitils/custom_page_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:foodapp/app/uitils/custom_page_route.dart';
import 'package:foodapp/ui/views/food_category_list/food_list_view.dart';
import 'package:foodapp/ui/widgets/spring_buttons.dart';

class FoodItemModel extends HookWidget {
  final String name, description, img,category;
  final List<FCategory> foods;

  const FoodItemModel(
      {Key key, @required this.name, this.description, this.img,this.foods,this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -7,
                  offset: Offset(0, 10),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                ),
              ],
              borderRadius: BorderRadius.circular(4))),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: SpringButton(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomRouting(Foodlisting(
                      food: foods??[],
                      category: category??'',
                    )),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(img ?? '')),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                onTap: () {
                  Navigator.push(
                    context,
                    CustomRouting(Foodlisting(
                      food:foods?? [],
                      category: category??'',
                    )),
                  );
                },
                title: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    VMargin(10),
                    Text(
                      name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                    const VMargin(7),
                    Text(
                      description ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // Container(
      //     padding: EdgeInsets.only(left: 15,right: 15),
      //     child: Divider(color: Colors.grey.shade500,
      //       height: 0.9,
      //     )),
    ]);
  }
}
