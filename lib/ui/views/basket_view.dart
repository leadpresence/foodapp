import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/models/category.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:foodapp/app/uitils/storage_service.dart';

class BasketView extends StatefulWidget {
  BasketView({Key key}) : super(key: key);

  @override
  _BasketViewState createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  StorageService service = StorageService();
  List<FCategory> myFoods = [];

  fetchData() async {
    myFoods = await service.getFoodFoodBasket();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, right: 8, left: 8, bottom: 20),
                child: myFoods != null
                    ? Column(
                        children: [
                          ListView.builder(
                            itemCount: myFoods.length,
                            itemBuilder: (context, index) {
                              FCategory item = myFoods[index];
                             return BasketItem(
                                item: item,
                              );
                            },
                          )
                        ],
                      )
                    : Center(
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
                            Text('Empty basket add some items'),
                          ],
                        ),
                      ))));
  }
}

class BasketItem extends StatelessWidget {
  final FCategory item;
  const BasketItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width - 30,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(item.imgurl),
          ),
          title: Text(item.name),
          subtitle: Text(
            item.price,
            style: TextStyle(color: Colors.pink, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
