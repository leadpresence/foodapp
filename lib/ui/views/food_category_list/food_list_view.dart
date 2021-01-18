import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/custom_page_route.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:foodapp/ui/views/basket-favorite/basket_view.dart';
import 'package:foodapp/ui/views/basket-favorite/favorite.dart';
import 'package:foodapp/ui/views/master_view.dart';
import 'food_grid.dart';

class Foodlisting extends StatefulWidget {
  //takes in a specific list of Food and its category
  final List<FCategory> food;
  final String category;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        Navigator.pop(context, CustomRouting(Master()));
                      }),
                  Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) + 35,
                    margin: EdgeInsets.symmetric(horizontal: 5),
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
                  IconButton(
                      icon: Icon(
                        FluentIcons.cart_20_regular,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        Navigator.pop(context, CustomRouting(BasketView()));

                      }),
                  IconButton(
                      icon: Icon(
                        FluentIcons.heart_20_regular,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        Navigator.pop(context, CustomRouting(Favorites()));

                      }),
                ],
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
