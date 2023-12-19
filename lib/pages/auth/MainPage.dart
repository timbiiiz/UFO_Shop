// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/auth/CartPage.dart';
import 'package:ufoapp/widgets/banner_widget.dart';
import 'package:ufoapp/widgets/custom_drower_widget.dart';
import 'package:ufoapp/widgets/heading-widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
        // ドロワーの色
        iconTheme: IconThemeData(color: Colors.white),
        // 右にカートを配置
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => CartPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),
      // 左側にドロワーウィジェット
      drawer: DrawerWidget(),
      body: Container(
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
            // ボディ部分
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 90.0,
                    ),
                    // banners
                    BannerWidget(),

                    // heading widgets(Category case)
                    HeadingWidget(
                      headingTitle: 'カテゴリー',
                      headingSubTitle: '最適な機体',
                      onTap: () {},
                      buttonText: 'もっと見る >',
                    ),

                    // heading widgets(flash sale case)
                    HeadingWidget(
                      headingTitle: 'セール中',
                      headingSubTitle: 'お得な機体',
                      onTap: () {},
                      buttonText: 'もっと見る >',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
