// ignore_for_file: file_names, prefer_const_constructors, unused_import, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ufoapp/auth/LoginPage.dart';
import 'package:ufoapp/auth/SignupPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.offAll(() => LoginPage());
    });
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
