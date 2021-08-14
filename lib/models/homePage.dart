import 'dart:ui';

import 'package:asosiysi/models/asosiyPage.dart';
import 'package:asosiysi/models/boshPage.dart';
import 'package:asosiysi/models/malumotlar.dart';
import 'package:asosiysi/models/pageaaaa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static List<dbmalumotlar> hammaMalumotlar = [];
  @override
  Widget build(BuildContext context) {
    hammaMalumotlar = malumotOlibKel();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 320.0,
            width: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/m2.jpg"),fit: BoxFit.cover
              )
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("What you would you like to find?", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),),
                  Container(
                    height: 110.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, left: 40.0, right: 40.0, top: 25.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                        textInputAction: TextInputAction.search,
                        autofocus: false,
                        maxLength: 30,
                        onSubmitted: (String s) {},
                        decoration: InputDecoration(
                            hintText: "Search for cities, places ...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 25.0,),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 450.0,
            child: ListView(
              children: [
                Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                        height: 30.0,
                        width: 400.0,
                        color: Colors.white,
                        alignment: Alignment.bottomLeft,
                        child: Text("Best Destination",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, ),),
                      ),
                      Container(
                        height: 180.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      image: AssetImage("${hammaMalumotlar[index].rasimlar}",),fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 170.0,
                                  width: 210.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 90.0, bottom: 10.0),
                                        alignment: Alignment.center,
                                        height: 30.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                          child: Text("${hammaMalumotlar[index].davlatlar}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),)),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AsosiyPage(index)));
                                },
                              );
                            },),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0, left: 20.0, top: 15.0),
                        height: 50.0,
                        width: 400.0,
                        color: Colors.white,
                        alignment: Alignment.bottomLeft,
                        child: Text("Best Hotels",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, ),),
                      ),
                      Container(
                        height: 180.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: AssetImage("${hammaMalumotlar[index].hotellar}",),fit: BoxFit.cover,
                                  ),
                                ),
                                height: 170.0,
                                width: 210.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 90.0, bottom: 10.0),
                                        alignment: Alignment.center,
                                        height: 30.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Text("${hammaMalumotlar[index].davlatlar}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),)),
                                  ],
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BoshPage(index)));
                              },
                            );
                          },),
                      ),
                    ],
                  ),
                ],),
          ),
        ],
      ),
    );
  }
  List<dbmalumotlar> malumotOlibKel(){
    List<dbmalumotlar> mashinalar = [];
    for(int i = 0; i < 5; i++){
      String rasimlar = Malumotlar.RASIMLAR_TURLARI[i].toLowerCase() + "$i.jpg";

      dbmalumotlar qoshiladiganMashina = dbmalumotlar(
        Malumotlar.RASIMLAR_TURLARI[i],
        Malumotlar.TITELLAR_TURLARI[i],
        Malumotlar.DAVLATLAR_NOMI[i],
        Malumotlar.MALUMOTLAR_NOMI[i],
        Malumotlar.HOTEL_RASIMLAR[i],
      );
      mashinalar.add(qoshiladiganMashina);
    }
    return mashinalar;
  }
}
