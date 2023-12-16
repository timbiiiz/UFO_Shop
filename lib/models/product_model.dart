// ignore_for_file: unused_import

import "package:flutter/material.dart";
import "package:get/get.dart";

class ProductModel {
  // 変数（フィールド）を宣言
  String iconPath;
  String price;
  String name;
  String detail;
  String speed;

  ProductModel({
    required this.iconPath,
    required this.price,
    required this.name,
    required this.detail,
    required this.speed,
  });

  static List<ProductModel> getProducts() {
    List<ProductModel> products = [];

    // Alminium UFO Basic
    products.add(ProductModel(
      name: 'Alminium UFO B',
      iconPath: 'assets/images/ufo99991.png',
      price: '       ￥2,000,000',
      detail: '安定した性能で空の旅を快適にしてくれる、ベーシックな機体です。',
      speed: '100Sl/h',
    ));

    // Alminium UFO Confy
    products.add(ProductModel(
      name: 'Alminium UFO C',
      iconPath: 'assets/images/ufo99992.png',
      price: '       ￥3,000,000',
      detail: 'イエローエネルギーで光る、快適な機体です。',
      speed: '280Sl/h',
    ));

    // Chitanium UFO Basic
    products.add(ProductModel(
      name: 'Chitanium UFO B',
      iconPath: 'assets/images/ufo99993.png',
      price: '        ￥4,000,000',
      detail: '上質なチタニウム加工を施し、イエローエネルギーで光る快適な機体です。',
      speed: '300Sl/h',
    ));

    // Chitanium UFO Confy
    products.add(ProductModel(
      name: 'Chitanium UFO C',
      iconPath: 'assets/images/ufo99994.png',
      price: '       ￥5,000,000',
      detail: '上質なチタニウム加工を施し、軽量化に成功しながら衝撃からも身を守れる快適な機体です。',
      speed: '400Sl/h',
    ));

    // UFORs hydrogen
    products.add(ProductModel(
      name: 'UFORs hydrogen',
      iconPath: 'assets/images/ufo99995.png',
      price: '        ￥8,000,000',
      detail: '機体を必要できる限り軽量化し、水素を採用した、光速な機体です。',
      speed: '1200Sl/h',
    ));

    //　Chitanium UFO Continental hydro
    products.add(ProductModel(
      name: '    UFO C hydro',
      iconPath: 'assets/images/ufo99996.png',
      price: '       ￥11,000,000',
      detail: '機体を軽量化し耐久性能向上。水素を採用した、光速で快適な機体です。',
      speed: '1000Sl/h',
    ));

    return products;
  }
}
