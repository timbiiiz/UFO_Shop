// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/models/product_items.dart';
import 'package:ufoapp/pages/auth/CartPage.dart';
import 'package:ufoapp/pages/products/Alminium_UFO_B.dart';
import 'package:ufoapp/pages/products/Alminium_UFO_C.dart';
import 'package:ufoapp/pages/products/Chitanium_UFO_B.dart';
import 'package:ufoapp/pages/products/Chitanium_UFO_C.dart';
import 'package:ufoapp/pages/products/UFORs_hydrogen.dart';
import 'package:ufoapp/pages/products/UFO_C_hydro.dart';
import 'package:ufoapp/widgets/custom_drower_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
            // 商品一覧
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Alminium UFO Basic
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => AlminiumUFOB());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99991.png',
                            name: 'Alminium UFO B',
                            price: '       ￥2,000,000'),
                      ),
                    ),
                    // Alminium UFO Confy
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => AlminiumUFOC());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99992.png',
                            name: 'Alminium UFO C',
                            price: '       ￥3,000,000'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Chitanium UFO Basic
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ChitaniumUFOB());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99993.png',
                            name: 'Chitanium UFO B',
                            price: '        ￥4,000,000'),
                      ),
                    ),
                    // Chitanium UFO Confy
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ChitaniumUFOC());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99994.png',
                            name: 'Chitanium UFO C',
                            price: '       ￥5,000,000'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // UFORs hydrogen
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => UFORsHydrogen());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99995.png',
                            name: 'UFORs hydrogen',
                            price: '        ￥8,000,000'),
                      ),
                    ),
                    // UFOC hydrogen
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => UFOCHydro());
                        },
                        child: ProductItem(
                            iconPath: 'assets/images/ufo99996.png',
                            name: ' UFOC hydrogen',
                            price: '       ￥11,000,000'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
