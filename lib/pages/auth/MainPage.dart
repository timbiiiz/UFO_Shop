// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:ufoapp/utils/glass_box.dart';
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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              // 商品をリスト化して表示
              child: ListView.separated(
                itemCount: products.length, // product_modelの個数を取得
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(height: 0),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            // 商品カード
                            GlassBox(
                              width: 170.0,
                              height: 220.0,
                              child: null,
                            ),
                            Spacer(),
                            // 商品カード
                            GlassBox(
                              width: 170.0,
                              height: 220.0,
                              child: null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
