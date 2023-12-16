// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/auth/MainPage.dart';

class AlminiumUFOB extends StatefulWidget {
  const AlminiumUFOB({super.key});

  @override
  State<AlminiumUFOB> createState() => _AlminiumUFOBState();
}

class _AlminiumUFOBState extends State<AlminiumUFOB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => MainPage());
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Alminium UFO B',
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
                child: Image.asset('assets/images/ufo99991.png'),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Container(
                      child: Text(
                        'Alminium UFO B',
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
                            '￥2,000,000',
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
                          'Speed: 100Sl/h',
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
                        '安定した性能で快適な空の旅を体感できる、ベーシックなモデルです。',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // カート
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          width: 200,
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    'カートに入れる',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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