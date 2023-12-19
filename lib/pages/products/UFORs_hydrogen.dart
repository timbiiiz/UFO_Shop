// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/auth/ProductPage.dart';

class UFORsHydrogen extends StatefulWidget {
  const UFORsHydrogen({super.key});

  @override
  State<UFORsHydrogen> createState() => _UFORsHydrogenState();
}

class _UFORsHydrogenState extends State<UFORsHydrogen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => ProductPage());
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'UFO C Hydro',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          /* 背景画像 */
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: const AssetImage('assets/images/galaxymoon.jpg'),
                /* 背景画像 薄くする */
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), // 透明度
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //　商品
          Column(
            children: [
              SizedBox(height: 50),
              Container(
                child: Image.asset('assets/images/ufo99995.png'),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Container(
                      child: Text(
                        'UFORs Hydrogen',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          child: Text(
                            '￥8,000,000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 120),
                      Container(
                        child: Text(
                          'Speed: 1200Sl/h',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 330,
                      child: Text(
                        '機体を必要できる限り軽量化し、水素を採用した、光速な機体です。',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  // カート
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        // Card()でelevationを使ってwidgetを浮かせる
                        Container(
                          width: 200,
                          height: 50,
                          child: Card(
                            elevation: 50.0, // 浮かせる大きさ
                            color: Colors.grey.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'カートに入れる',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
