// ignore_for_file: file_names, prefer_const_constructors, unused_import, avoid_unnecessary_containers

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ufoapp/controllers/get_user_data_controller.dart';
import 'package:ufoapp/pages/auth/MainPage.dart';
import 'package:ufoapp/pages/admin_panel/admin_main_page.dart';
import 'package:ufoapp/pages/auth/LoginPage.dart';
import 'package:ufoapp/pages/auth/SignupPage.dart';
import 'package:ufoapp/pages/auth/HomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Function(ロード時の処理)
      loggedin(context);
    });
  }

  // ロード時にどのページを表示させるかの処理(Function)
  Future<void> loggedin(BuildContext context) async {
    // もしuserが無効でない時、ユーザーデータを処理する
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      // もしユーザーデータを処理したとき、ユーザーデータのisAdminがtrueに設定されていた時、
      // AdminMainScreen()に遷移
      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
        // そうでない場合、MainPage()に遷移
      } else {
        Get.offAll(() => MainPage());
      }
      // userが無効だった場合、ログインされずWelcomePage()に遷移
    } else {
      Get.to(() => WelcomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        child: Expanded(
          child: Container(
            width: Get.width,
            alignment: Alignment.center,
            child: Lottie.asset('assets/images/ufoanimation.json'),
          ),
        ),
      ),
    );
  }
}
