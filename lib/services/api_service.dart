import 'dart:convert';

import 'package:NewsApp/model/article_model.dart';
import 'package:http/http.dart'; // package http ใช้สำหรับ http รีเควส นิยมใช้มากๆๆๆใน flutter

//สร้าง คลาส apiservice สำหรับ request services
class ApiService {
  //สร้างตัวเเปร endpoint สำหรับเก็บ api ข่าว ที่นำมา จาก newsapi.org
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c53e5f92ae694956a30f414cbaba39f9";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    //เช็ครีเควส ถ้า status 200  เท่ากับสำเร็จ
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //นำบทความต่างๆจาก json มาใส่ในรายการ
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
