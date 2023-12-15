// ignore_for_file: file_names, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ufoapp/pages/auth/LoginPage.dart';
import 'package:ufoapp/utils/product_box.dart';
import 'package:ufoapp/models/product_model.dart';
import 'package:ufoapp/widgets/custom_drower_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // product_model class 呼び出し
  List<ProductModel> products = [];

  // _getInitialInfo()するとモデルを一括管理できる(初期化された情報を受け取る。よくわからん、後で調べる)
  void _getInitialInfo() {
    products = ProductModel.getProducts(); // 中身使い方 e.g.-> products[index].name
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo(); // 呼び出し

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
        /* 右にログアウトアイコン設置 */
        actions: [
          // ログアウト機能
          GestureDetector(
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              await googleSignIn.signOut();
              Get.offAll(() => LoginPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout, size: 25, color: Colors.white),
            ),
          ),
        ],
        // ドロワーの色
        iconTheme: IconThemeData(color: Colors.white),
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
            SafeArea(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          // 商品カード
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: ProductBox(
                              width: 170.0,
                              height: 250.0,
                              child: null,
                            ),
                          ),
                          Spacer(),
                          // 商品カード
                          Padding(
                            padding: const EdgeInsets.only(top: 40, right: 15),
                            child: ProductBox(
                              width: 170.0,
                              height: 250.0,
                              child: null,
                            ),
                          ),
                        ],
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
