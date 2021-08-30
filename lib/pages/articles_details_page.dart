//หน้าบทความ

import 'package:NewsApp/model/article_model.dart'; // เรียกใช้ บทความ จากmodel
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final Article article; //สร้าง final  บทความ จาก model artcle

  ArticlePage({this.article}); //กำหนดค่า ArticlePage route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // appbar ของหน้าบทความ
        title: Text(article.title), //เรียกใช้ ชื่อเพจเป็นบทความ
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, //จัดกลุ่ม widget ด้านบน เเนวตั้ง
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดกลุ่ม widget ด้านบน แนวนอน
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //กล่องรูปของบทความ

                image: DecorationImage(
                    // กำหนด รูปของบทความ
                    image: NetworkImage(
                        article.urlToImage), //นำรูปมาจาก url ของบทความ
                    fit: BoxFit.cover), // กำหนดขนาดของรูป
                borderRadius: BorderRadius.circular(30.0), //กำหนดความเว้าจากขอบ
              ),
            ),
            SizedBox(
              height: 8.0, // กำหนด ขนาดของ sizedbox ของรูป
            ),
            Container(
              // กล่อง ใส่ชื่อผู้โพส เป็น สีเเดง
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red, //กำหนดสีกล่อง
                borderRadius:
                    BorderRadius.circular(30.0), //กำหนดความเว้าจากขอบ 30
              ),
              child: Text(
                article.source.name, // ผู้โพส เช่น yahoo กำหนดให้เป้นสีขาว
                style: TextStyle(
                  color: Colors.white, //สีในกล่องเเดง เป้นสี ขาว
                ),
              ),
            ),
            SizedBox(
              height: 8.0, // กำหนด ขนาดของ sizedbox ของบทความ
            ),
            Text(
              article.description, //ดึงค่าบทความจาก api มาใช้
              style: TextStyle(
                fontWeight: FontWeight.bold, //บทความตัวหนา
                fontSize: 16.0, //ขนาดบทความ
              ),
            )
          ],
        ),
      ),
    );
  }
}
