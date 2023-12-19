// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace, unused_field, unused_local_variable, unused_import, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufoapp/controllers/get_user_data_controller.dart';
import 'package:ufoapp/pages/admin_panel/admin_main_page.dart';
import 'package:ufoapp/pages/auth/ForgetPasswordPage.dart';
import 'package:ufoapp/pages/auth/MainPage.dart';
import 'package:ufoapp/pages/auth/SignupPage.dart';
import 'package:ufoapp/controllers/Log_in_controller.dart';
import 'package:ufoapp/controllers/google_sign_in_controller.dart';
import 'package:ufoapp/pages/auth/WelcomePage.dart';
import 'package:ufoapp/utils/glass_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Googleでログインするためのコントローラー
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  // メール、パスワードでログインするためのコントローラー
  final SignInController signInController = Get.put(SignInController());
  // ユーザーデータを取得するためのコントローラー
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController(); // ユーザー入力情報取得用
  TextEditingController userPassword = TextEditingController(); // ユーザー入力情報取得用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            /* 背景画像 */
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
                          'ログイン',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      /* メアド入力 */
                      SizedBox(
                        height: 40,
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
                      SizedBox(height: 55),
                      /* パスワード入力 */
                      Obx(
                        () => SizedBox(
                          height: 40,
                          width: 250.0,
                          child: TextFormField(
                            /* パスワード入力時隠す Obx()で囲って、signUpController()内にある、
                            isPasswordVisible.valueを使う */
                            obscureText:
                                signInController.isPasswordVisible.value, //
                            controller: userPassword, // ユーザー入力取得
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
                              icon: Icon(Icons.password_outlined,
                                  color: Colors.white),
                              suffixIcon: GestureDetector(
                                // パスワード隠す　隠さない　切り替え
                                onTap: () {
                                  signInController.isPasswordVisible.toggle();
                                },
                                child: signInController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off,
                                        color: Colors.white70, size: 16)
                                    : Icon(Icons.visibility,
                                        color: Colors.white70, size: 16),
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
                      SizedBox(height: 60),
                      /* ログインボタン */
                      TextButton(
                        child: GlassBox(
                          height: 35.0,
                          width: 100.0,
                          child: Text(
                            'ログイン',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // ログインボタンが押された時の処理
                        onPressed: () async {
                          String email = userEmail.text.trim();
                          String password = userPassword.text.trim();

                          // もし記入項目が抜けていたら、エラーを返す
                          if (email.isEmpty || password.isEmpty) {
                            Get.snackbar(
                              'Error',
                              '記入されていない項目があります',
                              snackPosition: SnackPosition.TOP, // 通知文表示topに表示
                              backgroundColor: Colors.white, // 通知文背景カラー
                              colorText: Colors.redAccent, // 通知文カラー
                            );
                            // または、ユーザーデータを受け取る(記入されてたら)
                          } else {
                            UserCredential? userCredential =
                                await signInController.signInMethod(
                                    email, password);
                            //
                            var userData = await getUserDataController
                                .getUserData(userCredential!.user!.uid);

                            // もしユーザー記入欄が有効だったとき、
                            if (userCredential != null) {
                              // もし、ユーザーがメール確認を済ませていた時、
                              if (userCredential.user!.emailVerified) {
                                // 管理者ログインに成功した時、管理者画面に遷移
                                if (userData[0]['isAdmin'] == true) {
                                  Get.snackbar(
                                    '管理者画面ログイン成功',
                                    '管理者画面に接続しました',
                                    snackPosition: SnackPosition.TOP, //通知文top表示
                                    backgroundColor: Colors.white, // 通知文背景カラー
                                    colorText: Colors.redAccent, // 通知文カラー
                                  );
                                  // 管理者画面に遷移
                                  Get.offAll(() => AdminMainScreen());

                                  // ログインに成功しなかったらMainPage()に遷移
                                } else {
                                  Get.offAll(() => MainPage());
                                  Get.snackbar(
                                    'ユーザーログイン成功',
                                    'ログインに成功しました',
                                    snackPosition: SnackPosition.TOP, //通知文top表示
                                    backgroundColor: Colors.white, // 通知文背景カラー
                                    colorText: Colors.redAccent, // 通知文カラー
                                  );
                                }

                                // そうでない時(ユーザーがメール認証を済ませていない場合)
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'メール認証が確認できませんでした',
                                  snackPosition:
                                      SnackPosition.TOP, // 通知文表示topに表示
                                  backgroundColor: Colors.white, // 通知文背景カラー
                                  colorText: Colors.redAccent, // 通知文カラー
                                );
                              }
                              // それら条件全てに当てはまらない場合
                            } else {
                              Get.snackbar(
                                'Error',
                                'もう一度お試しください',
                                snackPosition: SnackPosition.TOP, // 通知文表示topに表示
                                backgroundColor: Colors.white, // 通知文背景カラー
                                colorText: Colors.redAccent, // 通知文カラー
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      /* パスワードお忘れの方 */
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'パスワードをお忘れですか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => ForgetPasswordPage());
                                  },
                                  child: Text(
                                    'こちら',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      /* ボーダーライン */
                      GlassBox(
                        height: 1.0,
                        width: 320.0,
                        child: null,
                      ),
                      SizedBox(height: 40),
                      /* アカウント作成案内 */
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'UFO DEV.のアカウントをお持ちでないですか？ ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'アカウント作成',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAll(() => SignupPage());
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
                      SizedBox(height: 25),
                      /* expanded レスポンシブ, google, apple, , ログイン */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /* google icon */
                          TextButton(
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'assets/images/google.png',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              _googleSignInController.signInWithGoogle();
                            },
                          ),
                          /* Apple icon */
                          TextButton(
                            child: Container(
                              width: 37,
                              height: 37,
                              child: Image.asset(
                                'assets/images/apple.png',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          /* facebook icon */
                          TextButton(
                            child: Padding(
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
                            onPressed: () {},
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
