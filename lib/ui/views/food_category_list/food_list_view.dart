import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:like_button/like_button.dart';

class Foodlisting extends StatefulWidget {
  //takes in a specific list of Food and its category
  List<FCategory> food;
  String category;
  Foodlisting({Key key, this.food, this.category}) : super(key: key);

  @override
  _FoodlistingState createState() => _FoodlistingState();
}

class _FoodlistingState extends State<Foodlisting> {
  TextEditingController filter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28.0, right: 8, left: 8, bottom: 20),
          child: Column(
            children: <Widget>[
              const VMargin(20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -12,
                      offset: Offset(0, 5),
                      color: Colors.grey.withOpacity(0.02),
                      blurRadius: 25,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: new TextField(
                  controller: filter,
                  style: TextStyle(color: Colors.grey),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: new Icon(FluentIcons.search_24_regular),
                    hintText: 'Search for meals by name...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
              const VMargin(30),
              Expanded(
                child: BuildIFoodGridUI(
                  kfoodlist: widget.food ?? [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildIFoodGridUI extends HookWidget {
  final List<FCategory> kfoodlist;
  const BuildIFoodGridUI({Key key, this.kfoodlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: kfoodlist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return FoodBox(
          name: kfoodlist[index].name,
          imgurl: kfoodlist[index].imgurl,
          price: kfoodlist[index].price,
          isliked: kfoodlist[index].isliked,
        );
      },
    );
  }
}

class FoodBox extends StatelessWidget {
  final String name, category, price, imgurl, detail;
  final bool isliked;

  const FoodBox(
      {Key key,
      this.name,
      this.category,
      this.detail,
      this.imgurl,
      this.isliked,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          bottomRight: Radius.circular(20))
              ),
              child: Text(name??'',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
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
                  label: Text("\$${price}"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))
                          ),
                ),
                SizedBox(),
                InkWell(
                  child: Icon(
                    FluentIcons.cart_24_filled,
                    size: 30,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                ),
                LikeButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
