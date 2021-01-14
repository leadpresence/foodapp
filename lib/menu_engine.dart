import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodapp/ui/view_models.dart/menuVm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'app/uitils/providers.dart';

class MenuEngine extends StatefulHookWidget {
  MenuEngine({Key key}) : super(key: key);

  @override
  _MenuEngineState createState() => _MenuEngineState();
}

class _MenuEngineState extends State<MenuEngine>
    with SingleTickerProviderStateMixin {
  // read provider into the view model
  MenuVM get vm => context.read(menuVMProv);
  TabController tabController;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    //select a specific object in the view model
    var menuList = useProvider(menuVMProv.select((v) => v.pagesTabs));

    return Scaffold(
        body: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/KD9UFpgeFS.jpg"),
                    fit: BoxFit.scaleDown)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
            child: Column(
              children: <Widget>[
                VMargin(10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HMargin(170),
                      Text(
                          "${tabController.index == 0 ? 'Meals' : tabController.index == 1 ? 'Whishlist' : tabController.index == 2 ? 'Basket' : ''}"
                              .toUpperCase(),
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.pinkAccent[700],
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
                VMargin(10),
                Divider(
                  color: Colors.pinkAccent[700],
                  height: 3.5,
                ),
                Flexible(
                  child: TabBarView(
                      controller: tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: menuList),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              offset: Offset(0, 10),
              color: Colors.grey[400].withOpacity(0.5),
              blurRadius: 25,
            ),
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: tabController?.index ?? 0,
          onTap: (index) => setState(() => tabController.animateTo(index)),
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                FluentIcons.reciept_24_regular,
                color: Colors.orange,
              ),
              title: Text("Meals"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                FluentIcons.heart_24_filled,
                color: Colors.orange,
              ),
              title: Text("Favorites"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                FluentIcons.cart_24_filled,
                color: Colors.pink,
              ),
              title: Text("Basket"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
      ),
    ));
  }
}
