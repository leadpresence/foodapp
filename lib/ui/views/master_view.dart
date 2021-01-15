import 'package:flutter/material.dart';
import 'package:foodapp/app/uitils/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import './food_item_model.dart';

class Master extends StatefulHookWidget {
  Master({Key key}) : super(key: key);

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    context.read(masterVMProv).fetchFoodCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(masterVMProv);

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
              controller: provider.filter,
              style: TextStyle(color: Colors.grey),
              decoration: new InputDecoration(
                border: InputBorder.none,
                prefixIcon: new Icon(FluentIcons.search_24_regular),
                hintText: 'Search for meals by category...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
          const VMargin(30),
          Expanded(
            child: BuildItemsUI(),
          ),
        ],
      ),
    );
  }
}


class BuildItemsUI extends HookWidget {
  BuildItemsUI({Key key}) : super(key: key);

  List<CategoryModel> foodCategories = [


    CategoryModel(name: "vegetables",desc: "vegetables are a class of  food which is consist of fruits, leaves and the likes, they support high immunity and vitality",image: "https://image.freepik.com/free-photo/collection-vegetables-isolated-white-background_44074-1573.jpg"),
    CategoryModel(name: "protein",desc: "Proteins are a class of  food which is consist of fruits, leaves and the likes, they support high immunity and vitality",image: "https://image.freepik.com/free-photo/healthy-food-high-protein_82893-3.jpg"),
    CategoryModel(name: "carbohydrates",desc: "Carbohydrates are a class of  food which is consist of fruits, leaves and the likes, they support high immunity and vitality",image: "https://image.freepik.com/free-photo/selection-comptex-carbohydrates-sources-wood_89198-1206.jpg"),
    CategoryModel(name: "dairy",desc: "Dairy are a class of  food which is consist of fruits, leaves and the likes, they support high immunity and vitality",image: "https://image.freepik.com/free-photo/close-up-organic-milk-with-gourmet-cheese_23-2148610557.jpg")
 
  ];

  @override
  Widget build(BuildContext context) {
    var prov = useProvider(masterVMProv);
    return FutureBuilder(
      future: prov.fetchFoodCategories(context),
      builder: (context, snapshot) {
        // if (!snapshot.hasData)
        //   return Center(child: new CircularProgressIndicator()
        //   );
        return ListView.builder(
            itemCount: foodCategories.length,
            itemBuilder: (BuildContext _, index) {
              String kname, kdescription, img;
              kname = foodCategories[index].name;
              kdescription = foodCategories[index].desc;
              img = foodCategories[index].image;

              if (prov.foodFeeds.isEmpty)
                return Center(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.pink),
                    ),
                  ),
                );

              return FoodItemModel(
                name: kname,
                description: kdescription,
                img: img,
                foods: prov.foodFeeds.where((element) => element.category==kname),
              );
            });
      },
    );
  }
}

class CategoryModel {
  String name;
  String desc;
  String image;
  CategoryModel({this.name, this.desc, this.image});
}
