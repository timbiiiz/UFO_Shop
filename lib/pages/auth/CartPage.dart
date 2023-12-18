// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カート'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              child: Card(
                elevation: 5,
                color: Colors.black87,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('U', style: TextStyle(color: Colors.black)),
                  ),
                  title: Text(
                    'UFO Products',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('2200', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 25),
                      CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Text('+'),
                      ),
                      SizedBox(width: 25),
                      CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Text('-'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        margin: EdgeInsets.only(left: 30.0, bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('合計: '),
            Text('￥40,000,00'),
            SizedBox(width: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'お会計',
                      style: TextStyle(color: Colors.white),
                    ),
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
