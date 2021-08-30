import 'package:NewsApp/services/api_service.dart'; // import apiservice
import 'package:flutter/material.dart'; // import material
import 'components/customListTile.dart'; // เรียกใช้ components customlist tile
import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // root widget ของ app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดเเท็บ demo
      home: HomePage(), // เรียก homepage
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // เรียกใช้ Scaffold
      appBar: AppBar(
        title: Text("News App",
            style:
                TextStyle(color: Colors.black)), //กำหนดค่าตัวหนังสือ ใน app bar
        backgroundColor: Colors.white, //กำหนดค่า bg ใน app bar
      ),

      //เรียกใช้ ApiService ด้วย futurebuilder wiget และดึงค่าหน้าจาก ccustomlist มาใช้
      // ถ้ามีข้อมูลจาก api จะ render หน้า customlist มา แต่ถ้ายังไม่มี จะโหลด วนๆ
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //เช็ค response
          if (snapshot.hasData) {
            //สร้าง list ของ articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) => //บิ้ว customlist ข่าว
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child:
                CircularProgressIndicator(), // เเสดงความคืบหน้าในการ โหลด หน้า
          );
        },
      ),
    );
  }
}
