// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/controllers/forget_password_controller.dart';
import 'package:ufoapp/utils/glass_box.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  // 再設定するためのコントローラー
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController(); // ユーザー入力情報取得用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /* 背景画像 */
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: const AssetImage('assets/images/galaxymoon.jpg'),
                  /* 背景画像 薄くする */
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3), // 透明度
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /* キーボード開いた時　オーバーフローしない(SingleScrollView() */
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        child: Text(
                          'パスワード再設定',
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                      /* メアド入力 */
                      SizedBox(
                        height: 25,
                        width: 250,
                        child: TextFormField(
                          controller: userEmail, // ユーザー入力取得
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            /* 下線　色 */
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            hintText: 'メールアドレス',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      /* 送信ボタン */
                      TextButton(
                        child: GlassBox(
                          height: 33.0,
                          width: 82.0,
                          child: Text(
                            '送信',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // ログインボタンが押された時の処理
                        onPressed: () async {
                          String email = userEmail.text.trim();

                          // もし記入項目が抜けていたら、エラーを返す
                          if (email.isEmpty) {
                            Get.snackbar(
                              'Error',
                              '記入されていない項目があります',
                              snackPosition: SnackPosition.TOP, // 通知文表示topに表示
                              backgroundColor: Colors.white, // 通知文背景カラー
                              colorText: Colors.redAccent, // 通知文カラー
                            );
                            // そうでなければ、再設定メールを送る
                          } else {
                            String email = userEmail.text.trim();
                            forgetPasswordController.ForgetPasswordMethod(
                                email);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
