import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:foodapp/app/uitils/custom_page_route.dart';
import 'package:foodapp/app/uitils/margin.dart';


void main() {
  runApp(Foody());
}

class Foody extends StatelessWidget {
  const Foody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foody POC',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Orkney'),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Firebase.initializeApp(),
      builder: (context, snapshopt) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Stack(children: [
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
                          image: AssetImage("assets/images/Y6YDXvtQsL.jpg"),
                          fit: BoxFit.scaleDown)),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              border:
                                  Border.all(color: Colors.pink, width: 0.9)),
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  ((MediaQuery.of(context).size.height) / 12),
                              horizontal:
                                  ((MediaQuery.of(context).size.width) / 50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 20),
                            child: Text(
                              'Foody is a POC aplication for food delivery and purchase here we sow the basic feature of the cart and categories of food one can choose from.click below to continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1.6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Foody",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          )
                        ],
                      ),
                      const VMargin(50),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.0, vertical: 2),
                          child: Text(
                            'Get Started',
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 45, 15, 15),
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        height: 50,
                        width: MediaQuery.of(context).size.width - 50.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.pink, width: .9)),
                        child: FlatButton(
                          color: Colors.transparent,
                          textColor: Colors.black,
                          child: Text('Next'),
                          onPressed: () {
                            ///Move to the next screen
                            Navigator.push(
                                context, CustomRouting(MenuEngine()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}
