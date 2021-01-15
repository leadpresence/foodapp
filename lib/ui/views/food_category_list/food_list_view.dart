import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height - 100,
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
            child: BuildIFoodGridUI(),
          ),
        ],
      ),
    );
  }
}

class BuildIFoodGridUI extends HookWidget {
  final List<FCategory> kf;
  const BuildIFoodGridUI({Key key, this.kf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: kf.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return FoodBox(
          name: kf[index].name,
          imgurl: kf[index].imgurl,
          price: kf[index].price,
          isliked: kf[index].isliked,
          )
        ;
      },
    );
  }
}

class FoodBox extends StatelessWidget {
  final String name,category,price,imgurl,detail;
final  bool isliked;
  
  const FoodBox({Key key,
  this.name,
  this.category,
  this.detail,
  this.imgurl,
  this.isliked,
  this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container()

      ],),
    );
  }
}
