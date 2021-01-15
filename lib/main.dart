import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:foodapp/app/uitils/custom_page_route.dart';
import 'package:foodapp/app/uitils/margin.dart';
import 'package:foodapp/menu_engine.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


void main()async {


  
  runApp(
    
    ProviderScope(child:Foody()));
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
        return 
        Scaffold(
          backgroundColor: Colors.white,
          body:
           Padding(
             padding: EdgeInsets.only(top: 30),
             child: ListView(
              children: [
                // VMargin(30),

                  Container(
                    height: 260,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)
                      ),
                      image: DecorationImage(image:CachedNetworkImageProvider('https://image.freepik.com/free-photo/overhead-shot-different-fresh-vegetables-put-together-black-background_181624-26067.jpg') )
                    ),
                    ),
              VMargin(50),

                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                       const VMargin(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                                'Foody is a POC aplication for food delivery and purchase here we sow the basic feature of the cart and categories of food one can choose from.click below to continue',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const VMargin(40),

                     const VMargin(40),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    height: 50,
                    child: FlatButton(
                      color: Colors.greenAccent[700],
                      textColor: Colors.white,
                      child: Text('Next'),
                      onPressed: () {
                        Navigator.push(
                          context,
                         CustomRouting(MenuEngine())
                        );
                      },
                    ),
                  ),
                  const VMargin(20),
                
              ],
          ),
           ),
        );
      },
    );
  }
}
