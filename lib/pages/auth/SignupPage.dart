// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/pages/auth/LoginPage.dart';
import 'package:ufoapp/controllers/sign_up_controller.dart';
import 'package:ufoapp/utils/glass_box.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

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
                          'アカウント作成',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      /* メアド入力 */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
                          controller: userEmail, // データ取得
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
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
                      SizedBox(height: 30),
                      /* ユーザーネーム */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
                          controller: username, // データ取得
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.name,
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
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: 'ユーザーネーム',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      /* 電話番号入力 */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
                          controller: userPhone, // データ取得
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
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
                              Icons.phone,
                              color: Colors.white,
                            ),
                            hintText: '電話番号',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      /* 住所入力 */
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: TextFormField(
                          controller: userCity, // データ取得
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.streetAddress,
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
                              Icons.location_pin,
                              color: Colors.white,
                            ),
                            hintText: '住所',
                            hintStyle: TextStyle(
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
                        child: Obx(
                          () => TextFormField(
                            controller: userPassword, //　データ取得
                            /* パスワード入力時隠す Obx()で囲って、signUpController()内にある、
                            isPasswordVisible.valueを使う */
                            obscureText:
                                signUpController.isPasswordVisible.value,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Colors.white), //keyboardテキストカラー
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
                              suffixIcon: GestureDetector(
                                // パスワード隠す　隠さない　切り替え
                                onTap: () {
                                  signUpController.isPasswordVisible.toggle();
                                },
                                child: signUpController.isPasswordVisible.value
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.white70,
                                        size: 16,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.white70,
                                        size: 16,
                                      ),
                              ),
                              hintText: 'パスワード',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      /* アカウント作成ボタン */
                      TextButton(
                        child: GlassBox(
                          height: 35.0,
                          width: 125.0,
                          child: Text(
                            'アカウント作成',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // アカウント作成ボタンが押された時の処理
                        onPressed: () async {
                          String name = username.text.trim();
                          String email = userEmail.text.trim();
                          String phone = userPhone.text.trim();
                          String city = userCity.text.trim();
                          String password = userPassword.text.trim();
                          String userDeviceToken = '';
                          // もし記入項目が抜けていたら、エラーを返す
                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar(
                              'Error',
                              '記入されていない項目があります',
                              snackPosition: SnackPosition.TOP, // 通知文表示topに表示
                              backgroundColor: Colors.white, // 通知文背景カラー
                              colorText: Colors.redAccent, // 通知文カラー
                            );
                            // または、ユーザーデータを受け取る(記入されてたら)
                          } else {
                            UserCredential? userCredencial =
                                await signUpController.signUpMethod(
                              name,
                              email,
                              phone,
                              city,
                              password,
                              userDeviceToken,
                            );
                            // もし、ユーザー記入欄が有効だった時、確認メールを送る
                            if (userCredencial != null) {
                              Get.snackbar(
                                '認証メールをお送りしました。',
                                'メールボックスをご確認ください。',
                                snackPosition: SnackPosition.TOP, // 通知文表示topに表示
                                backgroundColor: Colors.white, // 通知文背景カラー
                                colorText: Colors.redAccent, // 通知文カラー
                              );

                              // メールを確認させるためにまずはログアウトさせる
                              // 確認後、ログインページからログインさせる
                              FirebaseAuth.instance.signOut();
                              Get.offAll(() => LoginPage());
                            }
                          }
                        },
                      ),
                      SizedBox(height: 35),
                      /* ボーダーライン */
                      GlassBox(
                        height: 1.0,
                        width: 320.0,
                        child: null,
                      ),
                      SizedBox(height: 25),
                      /* アカウント作成案内 */
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
