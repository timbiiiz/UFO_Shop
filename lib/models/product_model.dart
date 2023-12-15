// ignore_for_file: unused_import

import "package:flutter/material.dart";

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
      name: 'Alminium UFO Basic',
      iconPath: 'assets/images/ufo99991.png',
      price: '￥2,000,000',
      detail: '安定した性能で空の旅を快適にしてくれる、ベーシックな機体です。',
      speed: '100Sl/h',
    ));

    // Alminium UFO Basic
    products.add(ProductModel(
      name: 'Alminium UFO Continental',
      iconPath: 'assets/images/ufo99992.png',
      price: '￥3,000,000',
      detail: 'イエローエネルギーで光る、快適な機体です。',
      speed: '280Sl/h',
    ));

    // Alminium UFO Basic
    products.add(ProductModel(
      name: 'Metaric UFO Continental',
      iconPath: 'assets/images/ufo99993.png',
      price: '￥4,000,000',
      detail: '上質なメタリック加工を施し、イエローエネルギーで光る快適な機体です。',
      speed: '300Sl/h',
    ));

    // Metaric UFO nano
    products.add(ProductModel(
      name: 'Metaric UFO nano',
      iconPath: 'assets/images/ufo99994.png',
      price: '￥5,000,000',
      detail: '上質なメタリック加工を施し、重厚感のあるデザインの機体です。',
      speed: '300Sl/h',
    ));

    // UFO RS hydrogen
    products.add(ProductModel(
      name: 'UFO RS hydrogen',
      iconPath: 'assets/images/ufo99995.png',
      price: '￥10,000,000',
      detail: 'コンパクトな作りで機体を軽量化して加速力を上げ、最高のレースを楽しめる機体です。',
      speed: '860Sl/h',
    ));

    // UFO R grande
    products.add(ProductModel(
      name: 'UFO R grande',
      iconPath: 'assets/images/ufo99996.png',
      price: '￥12,000,000',
      detail: '質と快適さにこだわった、エレガントな機体です。',
      speed: '800Sl/h',
    ));

    return products;
  }
}
