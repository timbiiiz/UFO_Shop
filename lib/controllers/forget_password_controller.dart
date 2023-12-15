// ignore_for_file: unused_import, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/auth/LoginPage.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
    String userEmail,
    // 送信リクエスト
  ) async {
    try {
      EasyLoading.show(status: 'しばらくお待ちください');

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        '送信リクエスト成功',
        'パスワードリセットリンクを$userEmailにお送りしました',
        snackPosition: SnackPosition.TOP, // 通知文表示topに表示
        backgroundColor: Colors.white, // 通知文背景カラー
        colorText: Colors.redAccent, // 通知カラー
      );

      Get.offAll(() => LoginPage());

      EasyLoading.dismiss();
      // エラー処理
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.TOP, // 通知文表示topに表示
        backgroundColor: Colors.white, // 通知文背景カラー
        colorText: Colors.redAccent, // 通知カラー
      );
    }
  }
}
