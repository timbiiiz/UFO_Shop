// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ufoapp/pages/auth/LoginPage.dart';
import 'package:ufoapp/pages/auth/MainPage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Wrais',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Version 1.0.1',
                  style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  child: Text(
                    'W',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // 横線
            Divider(
              indent: 10.0, // 横線の長さ
              endIndent: 10.0, // 横線両脇の空間
              thickness: 1.5, // 線の太さ
              color: Colors.grey, // 横線の色
            ),
            // Home icon
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    'ホーム',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(Icons.home, color: Colors.white),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            // 商品アイコン
            GestureDetector(
              onTap: () {
                Get.to(() => MainPage());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    '商品',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(Icons.production_quantity_limits,
                      color: Colors.white),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            // カートアイコン
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'カート',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.shopping_bag, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            // お問い合わせアイコン
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'お問い合わせ',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.help, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            // ログアウトアイコン
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                // ログアウト機能
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => LoginPage());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'ログアウト',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.logout, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
