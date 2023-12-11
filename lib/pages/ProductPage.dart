// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ufoapp/utils/product_box.dart';
import 'package:ufoapp/utils/product_model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // product_model class 呼び出し
  List<ProductModel> products = [];

  // _getInitialInfo()するとモデルを一括管理できる(よくわからん、後で調べる)
  void _getInitialInfo() {
    products = ProductModel.getProducts(); // 中身使い方 e.g.-> products[index].name
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo(); // 呼び出し

    return Scaffold(
      body: ProductBox(
        height: 240,
        width: 200,
        child: null,
      ),
    );
  }
}