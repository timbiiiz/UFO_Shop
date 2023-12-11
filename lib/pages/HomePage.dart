// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/ProductPage.dart';
import 'package:ufoapp/utils/detail_button.dart';
import 'package:ufoapp/utils/glass_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true, // titleを真ん中に配置
        title: Container(
          child: Text(
            'UFO DEV.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        /* Stack() ウィジェット重ねている */
        child: Stack(
          children: [
            /* 背景画像 */
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/images/galaxy.jpg'),
                  /* 背景画像 薄くする */
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), // 透明度
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /* SafeArea,ListView　スクロール時バグらない */
            SafeArea(
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Center(
                          /* RichText テキストの一部分　色 */
                          child: RichText(
                            text: TextSpan(
                              text: '飛行機が必要ないほど快適な',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'UFO\n',
                                  style: TextStyle(
                                      color:
                                          Colors.purpleAccent.withOpacity(0.8),
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '揃えました。',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      /* 商品紹介 */
                      Stack(
                        children: [
                          // ガラスカード(glass_box.dart)
                          Container(
                            child: Center(
                              child: GlassBox(
                                height: 220.0, // double 小数点つけないとエラーなる
                                width: 330.0, // 上記と同じ
                                child: Text(
                                  'Metaric UFO nano',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), //glass_box.dart
                            ),
                          ),

                          // ufo99994番　画像
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: Container(
                                width: 250,
                                child:
                                    Image.asset('assets/images/ufo99994.png'),
                              ),
                            ),
                          ),

                          // ￥5,000,000
                          Padding(
                            padding: const EdgeInsets.only(top: 170),
                            child: Center(
                              child: Text(
                                '￥5,000,000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 80),

                      // 商品詳細ボタン
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => ProductsPage()); // ProductsPage()に遷移
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                child: DetailButton(
                                  height: 35.0,
                                  width: 130.0,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, right: 10),
                                child: Text(
                                  'enter',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, left: 40),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.black54,
                                  size: 25,
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
            ),
          ],
        ),
      ),
    );
  }
}
