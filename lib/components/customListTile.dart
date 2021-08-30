import 'package:NewsApp/model/article_model.dart'; // import บทความมาใช้
import 'package:NewsApp/pages/articles_details_page.dart'; // import หน้าบทความมา
import 'package:flutter/material.dart';

Widget customListTile(Article article, BuildContext context) {
  //widget สำหรับหน้า customlist
  return InkWell(
    //เป็น widget อันหนึง เอามาลองใช้
    onTap: () {
      //ฟังชั่นการกด
      Navigator.push(
          //คำสั่งที่ใช้นำทาง
          context,
          MaterialPageRoute(
              //ฟังชั่นสำหรับการส่ง route ไปหน้า articlepage
              builder: (context) => ArticlePage(
                    article: article, //
                  )));
    }, // หลังจากมีการกดจดนำทางไปยัง route articlepage ที่กำหนด
    child: Container(
      // กล่องต่างๆ
      margin: EdgeInsets.all(12.0), //มาจิ้นของกล่องข่าว
      padding: EdgeInsets.all(8.0), //ความห่างในกล่องข่าว
      decoration: BoxDecoration(
          //กล่อง
          color: Colors.white, //สีกล่อง
          borderRadius: BorderRadius.circular(12.0), //ความเว้ากล่อง
          boxShadow: [
            //ขอบกล่องพวกเงาวิ้งๆ
            BoxShadow(
              color: Colors.blue, //สีขอบกล่อง
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, //กำหนด ให้เริ่มด้านบน
        crossAxisAlignment: CrossAxisAlignment.start, //กำหนดให้เริ่มด้านบน
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //กำหนดขนาดรูป

              image: DecorationImage(
                  //เรียกใช้รูปจาก model
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0), //ความเว้ารูป
            ),
          ),
          SizedBox(
            //กำหนดขนาดกล่องร
            height: 8.0,
          ),
          Container(
            //กล่อง ชื่อ ผู้โพส
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red, //กำหนดสีกล่องผู้โพส
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.source.name, // เรียก ชื่อผู้โพส
              style: TextStyle(
                color: Colors.white, // สีข้อความของผู้โพส
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            // เรียกใช้ text บทความ
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold, //กำหนดลักษณะตัวหนังสือเป็นหนา
              fontSize: 16.0, //กำหนดขนาด
            ),
          )
        ],
      ),
    ),
  );
}
