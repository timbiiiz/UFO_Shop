// ignore_for_file: unnecessary_overrides, unused_local_variable, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  // 初期化処理
  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      // もしtokenが無効でない時、
      if (token != null) {
        deviceToken = token; // tokenをdeviceTokenに入れる
        print('token : $deviceToken');
        update(); // その都度丹生録された新しいtokenを取得する
      }
      // エラーを取得した時
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.TOP, // 警告文表示topに表示
        backgroundColor: Colors.white, // 警告文背景カラー
        colorText: Colors.redAccent, // 警告文カラー
      );
    }
  }
}
