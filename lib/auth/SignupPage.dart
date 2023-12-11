// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/auth/LoginPage.dart';
import 'package:ufoapp/utils/glass_box.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 55),
                      /* ユーザーネーム入力 */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
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
                              Icons.person,
                              color: Colors.white,
                            ),
                            labelText: 'ユーザーネーム',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      /* メアド入力 */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
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
                            labelText: 'メールアドレス',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      /* パスワード入力 */
                      SizedBox(
                        height: 40,
                        width: 250.0,
                        child: TextFormField(
                          style:
                              TextStyle(color: Colors.white), //keyboardテキストカラー
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
                              Icons.password_outlined,
                              color: Colors.white,
                            ),
                            labelText: 'パスワード',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 55),
                      /* サインアップボタン */
                      GlassBox(
                        height: 35.0,
                        width: 100.0,
                        child: Text(
                          'サインアップ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      /* ボーダーライン */
                      GlassBox(
                        height: 1.0,
                        width: 320.0,
                        child: null,
                      ),
                      SizedBox(height: 40),
                      /* ログイン案内 */
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'すでにUFO DEV.のアカウントをお持ちですか？ ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'ログイン',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAll(() => LoginPage());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'または',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      /* expanded レスポンシブ, google, apple, , ログイン */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /* google icon */
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/images/google.png',
                              color: Colors.white,
                            ),
                          ),
                          /* Apple icon */
                          Container(
                            width: 37,
                            height: 37,
                            child: Image.asset(
                              'assets/images/apple.png',
                              color: Colors.white,
                            ),
                          ),
                          /* facebook icon */
                          Padding(
                            padding: const EdgeInsets.only(top: 2.7),
                            child: Container(
                              width: 38,
                              height: 38,
                              child: Image.asset(
                                'assets/images/facebook.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
